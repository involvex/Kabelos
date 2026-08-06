<#
.SYNOPSIS
    Kabelos Android release script.
    Builds, signs, tags, and creates a draft GitHub release with APK artifacts.

.DESCRIPTION
    Reads the version from pubspec.yaml, tags the current commit, runs tests
    (optional), builds release APKs (split-per-abi + universal), verifies
    signatures, generates a changelog from git history, and creates a draft
    GitHub release with all artifacts uploaded.

.PARAMETER SkipTests
    Skip flutter test and Kotlin unit tests.

.PARAMETER SkipTag
    Skip git tag creation (use existing tag).

.PARAMETER SkipPush
    Skip pushing the tag to origin.

.PARAMETER SkipBuild
    Skip building APKs (useful if already built).

.PARAMETER DraftOnly
    Only create/update the GitHub draft release (skip build, tag, push).

.PARAMETER UniversalOnly
    Build only the universal APK (no split-per-abi).

.PARAMETER SplitOnly
    Build only the split-per-abi APKs (no universal).

.PARAMETER TagName
    Override the tag name (default: v{version} from pubspec.yaml).

.EXAMPLE
    .\scripts\release.ps1
    Full release: tag, test, build, push, draft release.

.EXAMPLE
    .\scripts\release.ps1 -SkipTests
    Skip tests but do everything else.

.EXAMPLE
    .\scripts\release.ps1 -DraftOnly
    Only create/update the GitHub draft release from existing APKs.

.EXAMPLE
    .\scripts\release.ps1 -TagName "v3.1.0-beta1"
    Use a custom tag name.
#>

[CmdletBinding()]
param(
    [switch]$SkipTests,
    [switch]$SkipTag,
    [switch]$SkipPush,
    [switch]$SkipBuild,
    [switch]$DraftOnly,
    [switch]$UniversalOnly,
    [switch]$SplitOnly,
    [string]$TagName
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path "$ScriptDir/.."
Set-Location $RepoRoot

# ---------------------------------------------------------------------------
# CONFIGURATION
# ---------------------------------------------------------------------------
$TargetPlatforms = "android-arm64,android-x64"
$ApkOutputDir = "build/app/outputs/flutter-apk"

# Find Android SDK
$AndroidHome = if ($env:ANDROID_HOME) { $env:ANDROID_HOME } else { $env:ANDROID_SDK_ROOT }
if (-not $AndroidHome) {
    $AndroidHome = Join-Path $env:LOCALAPPDATA "Android\Sdk"
}
$ApkSigner = Get-ChildItem -Path "$AndroidHome\build-tools" -Directory |
    Sort-Object Name -Descending |
    ForEach-Object { Join-Path $_.FullName "apksigner.bat" } |
    Where-Object { Test-Path $_ } |
    Select-Object -First 1

if (-not $ApkSigner) {
    Write-Error "apksigner not found under $AndroidHome\build-tools"
    exit 1
}

# ---------------------------------------------------------------------------
# HELPER FUNCTIONS
# ---------------------------------------------------------------------------
function Write-Step {
    param([string]$Message)
    Write-Host "`n=== $Message ===" -ForegroundColor Cyan
}

function Write-OK {
    param([string]$Message)
    Write-Host "  v  $Message" -ForegroundColor Green
}

function Write-Warn {
    param([string]$Message)
    Write-Host "  !  $Message" -ForegroundColor Yellow
}

function Write-Fail {
    param([string]$Message)
    Write-Host "  X  $Message" -ForegroundColor Red
}

function Invoke-Check {
    param([string]$Command, [string]$ErrorMessage)
    $result = Invoke-Expression $Command 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Fail "$ErrorMessage"
        Write-Host $result
        exit 1
    }
    return $result
}

function Get-Changelog {
    param([string]$VersionName, [int]$VersionCode, [string]$TagName)

    Write-Step "Generating changelog"

    # Find previous tag for changelog range
    $prevTag = (git tag --sort=-creatordate 2>$null |
        Where-Object { $_ -ne $TagName } |
        Select-Object -First 1)
    $range = if ($prevTag) { "$prevTag..HEAD" } else { "HEAD" }

    Write-Host "  Commit range: $range"

    $commits = git --no-pager log $range --oneline --no-merges 2>$null
    if (-not $commits) {
        Write-Warn "No commits found in range"
        return "No changelog available."
    }

    $fastlaneCode = $VersionCode + 1000
    $changelogPath = "fastlane/metadata/android/en-US/changelogs/$fastlaneCode.txt"
    $changelogFolder = Split-Path -Parent $changelogPath
    if (-not (Test-Path $changelogFolder)) {
        New-Item -ItemType Directory -Path $changelogFolder -Force | Out-Null
    }

    $bullets = ($commits -split "`n" | ForEach-Object {
        if ($_ -match '^\w+\s+(.+)$') {
            $msg = $Matches[1]
            "- $($msg.Substring(0, [Math]::Min($msg.Length, 120)))"
        }
    }) -join "`n"

    $full = "New in $VersionName :`n$bullets"
    $full | Set-Content -Path $changelogPath -NoNewline
    Write-OK "Changelog written to $changelogPath"
    Write-Host ("-" * 60)
    Write-Host $full
    Write-Host ("-" * 60)

    return $full
}

function Get-ApkInfo {
    param([string]$OutputDir)
    $apkFiles = Get-ChildItem "$OutputDir\*.apk" -ErrorAction SilentlyContinue
    if (-not $apkFiles) {
        Write-Error "No APKs found in $OutputDir"
        exit 1
    }
    $sizes = @{}
    $apkFiles | ForEach-Object { $sizes[$_.Name] = [math]::Round($_.Length / 1MB, 1) }
    return @{ Files = $apkFiles; Sizes = $sizes }
}

function Get-Checksums {
    param([array]$ApkFiles, [string]$OutputDir)
    $sha256File = "$OutputDir\SHA256SUMS.txt"
    $lines = $ApkFiles | ForEach-Object {
        $hash = (Get-FileHash $_.FullName -Algorithm SHA256).Hash.ToLower()
        "$hash  $($_.Name)"
    }
    $lines | Set-Content $sha256File
    return @{ Lines = $lines; File = $sha256File }
}

function Publish-GitHubRelease {
    param(
        [string]$Tag,
        [string]$Title,
        [string]$Changelog,
        [array]$ApkFiles,
        [hashtable]$ApkSizes,
        [array]$ChecksumLines,
        [string]$ChecksumFile,
        [string]$FlutterVersion
    )

    Write-Step "Creating GitHub draft release"

    $apkTable = ""
    foreach ($apk in $ApkFiles) {
        $abi = switch -Wildcard ($apk.Name) {
            "*arm64*" { "arm64-v8a" }
            "*x86_64*" { "x86_64" }
            "*release*" { "Universal" }
            default { "unknown" }
        }
        $sz = $ApkSizes[$apk.Name]
        $fn = $apk.Name
        $apkTable += "| ``$fn`` | $sz MB | $abi |`r`n"
    }

    $sumsBlock = ($ChecksumLines -join "`r`n")

    $notes = @"
$Changelog

## APKs

$apkTable
## SHA256

``````
$sumsBlock
``````

**Signed with release certificate.** Built from commit ``$(git rev-parse --short HEAD)`` using Flutter $FlutterVersion.
"@

    $notesFile = [System.IO.Path]::GetTempFileName()
    $notes | Set-Content -Path $notesFile

    # Check for existing release
    $existing = gh release view $Tag --json url 2>$null
    if ($existing) {
        Write-Warn "Release '$Tag' already exists, updating..."
        $uploadArgs = @($ApkFiles.FullName; $ChecksumFile)
        gh release upload $Tag $uploadArgs --clobber 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) { Write-OK "Assets uploaded" }

        gh release edit $Tag --notes-file $notesFile --prerelease --latest=false 2>&1
        if ($LASTEXITCODE -eq 0) { Write-OK "Release notes updated" }
    }
    else {
        $uploadArgs = @($ApkFiles.FullName; $ChecksumFile)
        gh release create $Tag `
            --title $Title `
            --notes-file $notesFile `
            --prerelease `
            --latest=false `
            $uploadArgs 2>&1
        if ($LASTEXITCODE -eq 0) { Write-OK "Draft release created" }
    }

    Remove-Item $notesFile -ErrorAction SilentlyContinue

    $url = gh release view $Tag --json url --jq '.url' 2>$null
    if ($url) { Write-OK "Release URL: $url" }
}

# ---------------------------------------------------------------------------
# PARSE VERSION
# ---------------------------------------------------------------------------
Write-Step "Parsing version from pubspec.yaml"

$pubspec = Get-Content "pubspec.yaml" -Raw
if ($pubspec -notmatch 'version:\s*(\d+\.\d+\.\d+)\+(\d+)') {
    Write-Error "Could not parse version from pubspec.yaml"
    exit 1
}
$VersionName = $Matches[1]
$VersionCode = [int]$Matches[2]
$ArmCode = $VersionCode + 1000
$X64Code = $VersionCode + 3000

$Tag = if ($TagName) { $TagName } else { "v$VersionName" }
$ReleaseTitle = "Kabelos $VersionName"

Write-Host "  Version name : $VersionName"
Write-Host "  Version code : $VersionCode (arm64: $ArmCode, x86_64: $X64Code)"
Write-Host "  Tag          : $Tag"

# ---------------------------------------------------------------------------
# DRAFT ONLY MODE
# ---------------------------------------------------------------------------
if ($DraftOnly) {
    Write-Step "Draft-only mode: creating GitHub release from existing APKs"

    $info = Get-ApkInfo -OutputDir $ApkOutputDir
    Write-Host "Found APKs:"
    $info.Files | ForEach-Object {
        Write-Host "  $($_.Name) ($($info.Sizes[$_.Name]) MB)"
    }

    $checksums = Get-Checksums -ApkFiles $info.Files -OutputDir $ApkOutputDir
    $flutterVer = (flutter --version 2>&1 | Select-Object -First 1) -replace '^Flutter\s+', ''
    $changelog = Get-Changelog -VersionName $VersionName -VersionCode $VersionCode -TagName $Tag

    Publish-GitHubRelease -Tag $Tag -Title $ReleaseTitle -Changelog $changelog `
        -ApkFiles $info.Files -ApkSizes $info.Sizes `
        -ChecksumLines $checksums.Lines -ChecksumFile $checksums.File `
        -FlutterVersion $flutterVer
    exit 0
}

# ---------------------------------------------------------------------------
# PRE-FLIGHT CHECKS
# ---------------------------------------------------------------------------
Write-Step "Pre-flight checks"

$dirty = git status --porcelain
if ($dirty) {
    Write-Warn "Uncommitted changes:"
    Write-Host $dirty
    $answer = Read-Host "Continue anyway? (y/N)"
    if ($answer -notmatch '^[yY]') { Write-Host "Aborted."; exit 0 }
}

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Error "GitHub CLI (gh) not found. Install: https://cli.github.com/"
    exit 1
}
gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Error "GitHub CLI not authenticated. Run: gh auth login"
    exit 1
}
Write-OK "GitHub CLI authenticated"

if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
    Write-Error "Flutter not found in PATH"
    exit 1
}
$FlutterVer = (flutter --version 2>&1 | Select-Object -First 1) -replace '^Flutter\s+', ''
Write-OK "Flutter $FlutterVer"

# Check signing config
$keyProps = "$RepoRoot/android/key.properties"
if (-not (Test-Path $keyProps)) {
    Write-Error "key.properties not found at $keyProps"
    exit 1
}
$keyContent = Get-Content $keyProps -Raw
if ($keyContent -notmatch 'storeFile\s*=\s*(.+)') {
    Write-Error "Could not parse storeFile from key.properties"
    exit 1
}
$StoreFileRel = $Matches[1].Trim()
$storeFileAbs = Resolve-Path "$RepoRoot/android/$StoreFileRel" -ErrorAction SilentlyContinue

if (-not $storeFileAbs -or -not (Test-Path $storeFileAbs)) {
    Write-Warn "Release keystore not found ($StoreFileRel)"
    Write-Warn "Build will use debug keystore as fallback."
    $answer = Read-Host "Continue with debug keystore? (y/N)"
    if ($answer -notmatch '^[yY]') { Write-Host "Aborted."; exit 0 }
} else {
    Write-OK "Release keystore: $StoreFileRel"
}

# Tag conflict check
$headSha = git rev-parse HEAD
$tagSha = git rev-parse $Tag 2>$null
if ($tagSha -and $tagSha -ne $headSha) {
    Write-Warn "Tag '$Tag' exists on a different commit"
    Write-Host "  Tag : $tagSha"
    Write-Host "  HEAD: $headSha"
    $answer = Read-Host "Delete existing tag and recreate on HEAD? (y/N)"
    if ($answer -notmatch '^[yY]') { Write-Host "Aborted."; exit 0 }
    git tag -d $Tag
    git push --delete origin $Tag 2>$null
    Write-OK "Removed existing tag '$Tag'"
} elseif ($tagSha) {
    Write-OK "Tag '$Tag' already on HEAD"
}

# ---------------------------------------------------------------------------
# FLUTTER ANALYZE
# ---------------------------------------------------------------------------
Write-Step "Flutter analyze"
Invoke-Check "flutter analyze" "Flutter analyze failed"
Write-OK "Flutter analyze passed"

# ---------------------------------------------------------------------------
# TESTS
# ---------------------------------------------------------------------------
if (-not $SkipTests) {
    Write-Step "Running Dart tests"
    Invoke-Check "flutter test" "Dart tests failed"
    Write-OK "Dart tests passed"

    Write-Step "Running Kotlin unit tests"
    Push-Location "$RepoRoot/android"
    try {
        Invoke-Check ".\gradlew.bat testReleaseUnitTest --no-daemon" "Kotlin tests failed"
        Write-OK "Kotlin tests passed"
    }
    finally { Pop-Location }
} else {
    Write-Warn "Tests skipped"
}

# ---------------------------------------------------------------------------
# BUILD
# ---------------------------------------------------------------------------
if (-not $SkipBuild) {
    Write-Step "Cleaning build output"
    Invoke-Check "flutter clean" "Flutter clean failed"
    Write-OK "Clean done"

    Write-Step "Fetching dependencies"
    Invoke-Check "flutter pub get" "Flutter pub get failed"
    Write-OK "Dependencies resolved"

    $buildSplit = -not $UniversalOnly
    $buildUni = -not $SplitOnly

    if ($buildSplit) {
        Write-Step "Building split-per-abi release APKs"
        Invoke-Check "flutter build apk --release --split-per-abi --target-platform $TargetPlatforms" `
            "Split APK build failed"
        Write-OK "Split APKs built"

        $armApk = "$ApkOutputDir\app-arm64-v8a-release.apk"
        if (Test-Path $armApk) {
            $sz = [math]::Round((Get-Item $armApk).Length / 1MB, 1)
            Write-OK "arm64-v8a: $sz MB"
            $sc = & $ApkSigner verify --print-certs $armApk 2>&1
            if ($LASTEXITCODE -eq 0 -and $sc -match 'CN=(.+)') {
                Write-OK "Signed by: $($Matches[1])"
            } else { Write-Fail "APK signature verification failed for arm64" }
        }

        $x64Apk = "$ApkOutputDir\app-x86_64-release.apk"
        if (Test-Path $x64Apk) {
            $sz = [math]::Round((Get-Item $x64Apk).Length / 1MB, 1)
            Write-OK "x86_64: $sz MB"
        }
    }

    if ($buildUni) {
        Write-Step "Building universal release APK"
        Invoke-Check "flutter build apk --release --target-platform $TargetPlatforms" `
            "Universal APK build failed"
        Write-OK "Universal APK built"

        $uniApk = "$ApkOutputDir\app-release.apk"
        if (Test-Path $uniApk) {
            $sz = [math]::Round((Get-Item $uniApk).Length / 1MB, 1)
            Write-OK "Universal: $sz MB"
            $sc = & $ApkSigner verify --print-certs $uniApk 2>&1
            if ($LASTEXITCODE -eq 0 -and $sc -match 'CN=(.+)') {
                Write-OK "Signed by: $($Matches[1])"
            } else { Write-Fail "APK signature verification failed for universal" }
        }
    }
} else {
    Write-Warn "Build skipped"
}

# ---------------------------------------------------------------------------
# COLLECT & HASH
# ---------------------------------------------------------------------------
Write-Step "Collecting APK artifacts"
$info = Get-ApkInfo -OutputDir $ApkOutputDir
foreach ($apk in $info.Files) {
    Write-Host "  $($apk.Name) ($($info.Sizes[$apk.Name]) MB)"
}

Write-Step "Generating SHA256 checksums"
$checksums = Get-Checksums -ApkFiles $info.Files -OutputDir $ApkOutputDir
Write-OK "Wrote $($info.Files.Count) checksums"
foreach ($line in $checksums.Lines) { Write-Host "  $line" }

# ---------------------------------------------------------------------------
# CHANGELOG
# ---------------------------------------------------------------------------
$changelog = Get-Changelog -VersionName $VersionName -VersionCode $VersionCode -TagName $Tag

# ---------------------------------------------------------------------------
# TAG & PUSH
# ---------------------------------------------------------------------------
if (-not $SkipTag) {
    Write-Step "Creating git tag"
    if (-not (git tag -l $Tag)) {
        git tag -a $Tag -m $ReleaseTitle
        Write-OK "Tag '$Tag' created on $(git rev-parse --short HEAD)"
    } else {
        Write-OK "Tag '$Tag' already exists"
    }

    if (-not $SkipPush) {
        Write-Step "Pushing tag to origin"
        git push origin $Tag
        Write-OK "Tag '$Tag' pushed"
    } else {
        Write-Warn "Push skipped"
    }
} else {
    Write-Warn "Tag creation skipped"
}

# ---------------------------------------------------------------------------
# GITHUB RELEASE
# ---------------------------------------------------------------------------
Publish-GitHubRelease -Tag $Tag -Title $ReleaseTitle -Changelog $changelog `
    -ApkFiles $info.Files -ApkSizes $info.Sizes `
    -ChecksumLines $checksums.Lines -ChecksumFile $checksums.File `
    -FlutterVersion $FlutterVer

# ---------------------------------------------------------------------------
# SUMMARY
# ---------------------------------------------------------------------------
Write-Step "Release complete"
Write-Host ""
Write-Host ("  Tag       : " + $Tag) -ForegroundColor Green
Write-Host ("  Version   : $VersionName+$VersionCode") -ForegroundColor Green
Write-Host ""
Write-Host "  APKs:" -ForegroundColor Green
foreach ($apk in $info.Files) {
    Write-Host ("    $($apk.Name) ($($info.Sizes[$apk.Name]) MB)") -ForegroundColor Green
}
Write-Host ""
Write-Host ("  Keystore  : $StoreFileRel") -ForegroundColor Yellow
Write-Host ("  Hashes    : $ApkOutputDir\SHA256SUMS.txt") -ForegroundColor Yellow

$clPath = "fastlane/metadata/android/en-US/changelogs/$($VersionCode + 1000).txt"
if (Test-Path $clPath) {
    Write-Host ("  Changelog : $clPath") -ForegroundColor Yellow
}
