# Android Release Process

## 1. Prepare the release commit

Confirm that `pubspec.yaml` contains the intended version name and base version
code. For Kabelos 3.0.0:

```yaml
version: 3.0.0+3001
```

Flutter adds ABI-specific offsets when `--split-per-abi` is used. The resulting
3.0.0 APK version codes are:

- `arm64-v8a`: `4001`
- `x86_64`: `6001`

Keep Fastlane changelogs for those generated version codes in
`fastlane/metadata/android/en-US/changelogs/`.

## 2. Commit the release source

```powershell
git status
git add README.md RELEASING.md android/app/build.gradle.kts fastlane
git commit -m "Prepare Kabelos 3.0.0 release"
```

Do not create or push the tag yet. Build the final artifacts from this clean
commit first.

## 3. Build only supported ABIs

Kabelos bundles libopus for `arm64-v8a` and `x86_64`. Do not publish an
`armeabi-v7a` APK.

Start from clean generated output so a stale unsupported APK cannot be uploaded:

```powershell
flutter clean
flutter pub get
flutter test
flutter build apk --release --split-per-abi --target-platform android-arm64,android-x64
```

Expected files:

```text
build/app/outputs/flutter-apk/app-arm64-v8a-release.apk
build/app/outputs/flutter-apk/app-x86_64-release.apk
```

## 4. Test the release

- Install and launch the arm64 APK on a physical Android device.
- Connect to another Protocol v2 device.
- Test chat, a file transfer, a speed test, and Audio Link.
- Confirm that a Protocol v1 peer produces a clear compatibility error.
- Confirm that the release is signed with the same certificate as the prior
  release.
- Confirm `git status --short` is empty except for intentionally ignored build
  output.

## 5. Push and tag

```powershell
git push origin main
git tag -a v3.0.0 -m "Kabelos 3.0.0"
git push origin v3.0.0
```

The tag must point to the exact commit used to build the uploaded APKs.

## 6. Create the GitHub release

Create a release from tag `v3.0.0` with title `Kabelos 3.0.0`. Upload only:

- `app-arm64-v8a-release.apk`
- `app-x86_64-release.apk`

Do not upload an `armeabi-v7a` APK. Publish the release only after both assets
finish uploading.

