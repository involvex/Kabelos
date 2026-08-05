# AGENTS.md

Instructions for AI coding agents working in this repository (Kabelos).

This file is the single source of truth for agent behavior in this repo. It is written for code
agents, so it is specific about where code lives, what commands to use, and which behaviors are
forbidden. If a statement here conflicts with a generic instruction, this file wins.

## Project Overview

Kabelos is an offline, peer-to-peer transfer app: file transfer, chat, speed
tests, and audio streaming over Wi-Fi Direct. No internet, router, or hotspot is required.

- This repository contains the **Flutter Android client** only (version 3.0.0, Protocol v2).
- A separate Windows companion client lives in the [WDCableWUI](https://github.com/jingcjie/WDCableWUI)
  repository. Do **not** port Windows concepts (e.g. `WiFiDirectAdvertisementPublisher`) into this
  Android codebase.
- Protocol v2 is **not** compatible with Protocol v1. Both devices must run a Protocol v2 build.
- Android support: Android 13+ (minSdk 33), ABIs `arm64-v8a` and `x86_64` only.
  `armeabi-v7a` is **not** supported and must never be published.

Key entry points for agents:

- `connection_imp_plan.md` — detailed, agent-facing design notes for the Wi-Fi Direct connection
  layer (permissions, state machine, scan/connect/disconnect rules, "Do Not Do" list). **Read this
  before touching anything related to Wi-Fi Direct connectivity.**
- `README.md` — product overview, screenshots, troubleshooting, user-facing features.
- `RELEASING.md` — the exact release process (version codes, signing, tags).
- `.github/workflows/android-release.yml` — CI build configuration (pin the exact Flutter/NDK/SDK
  versions listed there when working on the build).

## Useful Commands

Run everything from the repository root. All paths below are relative to the repo root.

### Dependency management

```sh
flutter pub get        # fetch Dart dependencies (pubspec.lock is committed)
flutter pub outdated   # list dependency updates
```

Do not use `flutter pub upgrade` casually; keep dependency bumps in a separate commit and verify
with `flutter analyze` and `flutter test`.

### Analysis and formatting

```sh
flutter analyze        # static analysis; must be clean before committing
dart format lib test   # format Dart code (single quotes, 80 cols, trailing commas per dart format)
```

### Tests

```sh
flutter test                              # Dart/Flutter unit tests
(cd android && ./gradlew testReleaseUnitTest --no-daemon)   # Kotlin unit tests
```

Use PowerShell on Windows: `cd android; .\gradlew.bat testReleaseUnitTest --no-daemon`.

### Localization

The app is localized with `flutter gen-l10n` (configured in `l10n.yaml`):

```sh
flutter gen-l10n       # regenerate lib/l10n/app_localizations*.dart from .arb files
```

- Template file: `lib/l10n/app_en.arb`; supported locales: `en`, `zh` (`lib/l10n/app_zh.arb`).
- Generated files (`app_localizations*.dart`) are committed to the repo.
- Add new user-facing strings to **both** `app_en.arb` and `app_zh.arb`, then run `flutter gen-l10n`.

### Build (Android)

```sh
flutter run                                   # debug on a connected device
flutter build apk --debug                     # debug APK (all supported ABIs)
flutter build apk --release --split-per-abi --target-platform android-arm64,android-x64
                                              # release APKs: app-arm64-v8a-release.apk and
                                              # app-x86_64-release.apk under build/app/outputs/flutter-apk/
flutter clean                                 # wipe build output (do this before a release build)
```

Never build with `--target-platform android-arm` / `android-arm64,android-x64,android-arm`
(no `armeabi-v7a` libopus binary exists).

### Git

```sh
git status
git log --oneline -10
git diff
```

Commit style in this repo is short, lowercase summaries (e.g. `readme`, `ui fix`, `v5`,
`Prepare Kabelos 3.0.0 release`). Follow the existing style; do not invent a new convention.
Only commit, tag, or push when explicitly asked.

## Technologies

| Layer | Technology | Notes |
| --- | --- | --- |
| UI framework | Flutter / Dart | Pinned: Flutter `3.44.0`, Dart SDK `^3.8.1` (pubspec.yaml). CI verifies the exact Flutter revision `559ffa3f75e7402d65a8def9c28389a9b2e6fe42`. |
| State management | `provider` (`^6.1.1`) + `ChangeNotifier` | Theme and language providers in `main.dart`; controller owns app state. |
| Native Android | Kotlin | All Wi-Fi Direct, session, protocol, audio, and file-transfer logic is native Kotlin. |
| Native C++ | CMake + JNI | `android/app/src/main/cpp/wdcable_opus_jni.cpp` wraps prebuilt libopus. |
| Audio codec | libopus 1.6.1 (prebuilt) | `android/app/src/main/jniLibs/{arm64-v8a,x86_64}/libopus.so`; see `jniLibs/README.md` for provenance. |
| Transport | Wi-Fi Direct (WifiP2pManager), TCP, UDP | Protocol v2; see `ProtocolConstants.kt` (magic `0x57444342` "WDCB", ports 8987/8988/8989). |
| Localization | `flutter_localizations` + `intl` | ARB files in `lib/l10n`; locales `en`, `zh`. |
| Storage | SharedPreferences via MethodChannel | `DataManager` singleton in `lib/services/data_manager.dart`; prefs name `wifi_direct_cable_prefs`. |
| CI/CD | GitHub Actions (`ubuntu-24.04`) | Java 17 (Temurin), Android API 36, build-tools 36.0.0, NDK 28.2.13676358, CMake 3.22.1. |
| Store metadata | Fastlane | `fastlane/metadata/android/en-US/` (title, descriptions, screenshots, changelogs). |

### Platform scope

This repo contains **only** the `android/` platform folder. There are no `windows/`, `ios/`,
`web/`, `macos/`, or `linux/` folders. Do not add platform folders or platform-specific code
without an explicit request.

## Architecture

The app is a Dart UI over a native Kotlin engine. The native layer owns all hardware/platform
state; Dart observes state and sends user intent.

```
lib/
  main.dart                        # app entry, providers, tab shell (6 tabs)
  wifi_direct_service.dart         # MethodChannel + event stream bridge (event classes)
  controllers/wifi_direct_controller.dart  # Dart state owner; mirrors native events
  models/wifi_direct_models.dart   # immutable data models incl. WiFiDirectState (copyWith)
  services/data_manager.dart       # SharedPreferences wrapper (singleton)
  providers/language_provider.dart # locale persistence (ChangeNotifier)
  theme/theme_provider.dart        # light/dark theme (ChangeNotifier)
  utils/app_logger.dart            # AppLogger (dart:developer)
  widgets/                         # connection_tab, chat_tab, speed_test_tab, audio_tab,
                                   # file_transfer_tab, settings_tab
  l10n/                            # ARB sources + generated AppLocalizations

android/app/src/main/
  kotlin/com/involvex/kabelos/
    MainActivity.kt
    FlutterMethodChannelHandler.kt # all MethodChannel methods dispatched here
    WiFiDirectManager.kt           # native owner of Wi-Fi Direct lifecycle
    WiFiDirectBroadcastReceiver.kt
    WdCableRuntime.kt              # runtime receiver ownership
    PermissionManager.kt           # permission gating (NEARBY_WIFI_DEVICES on API 33+)
    session/                       # SessionManager, SessionStateMachine, ProtocolV2TransportSetup, ...
    protocol/                      # ProtocolChannel, ProtocolCodec, ProtocolConstants, ...
    audio/                         # AudioService, NativeOpus, JitterBuffer, RTP/RTCP packets
    diagnostics/DiagnosticsLogger.kt
  cpp/wdcable_opus_jni.cpp         # libopus JNI bridge (CMakeLists.txt)
  jniLibs/                         # prebuilt libopus .so files
```

### Key architectural rules

- **Native owns Wi-Fi Direct state.** `WiFiDirectManager.kt` is the single owner of the Wi-Fi
  Direct lifecycle. Dart must mirror native events and must not infer long-lived discovery/listen
  state from method-call return timing.
- **Dart ↔ native contract:** `lib/wifi_direct_service.dart` exposes a `MethodChannel`
  (`wifi_direct_cable`) and typed event classes (`PeersChangedEvent`, `NativeStateChangedEvent`,
  `SessionStateChangedEvent`, file-transfer events, audio events, ...). The controller listens to
  the event stream and publishes `WiFiDirectState` snapshots via `stateStream`.
- **Method names are a contract.** Method names used in `wifi_direct_service.dart` must match
  the `when (call.method)` branches in `FlutterMethodChannelHandler.kt`. Renaming one without the
  other breaks the app. Prefer adding a new method over changing the meaning of an existing one.

## Best Practices and Guidelines

### General

- Read `connection_imp_plan.md` before any work touching Wi-Fi Direct discovery, listening,
  scanning, connecting, or disconnecting. It contains hard rules the project already committed to.
- Keep Android and Windows behavior separate. Do not copy Windows advertisement/listener concepts
  into this Android project (and vice versa).
- Use `AppLogger` (`lib/utils/app_logger.dart`) for Dart logging, and `DiagnosticsLogger`
  (Kotlin) for native logging. Do not use `print`.
- Keep state immutable: `WiFiDirectState` and model classes use `copyWith` (with a sentinel
  `_unset` value to allow clearing nullable fields). Follow this pattern when extending models;
  there is a test covering the clearing behavior (`test/wifi_direct_state_test.dart`).
- Preserve the `2-space` Kotlin / Dart formatting the repo already uses. Run `dart format` and
  `flutter analyze` before finishing any change.

### Dart guidelines

- Lints: `package:flutter_lints/flutter.yaml` (from `analysis_options.yaml`). Do not disable lints
  globally; prefer targeted `// ignore:` comments with a reason.
- Single quotes for strings, trailing commas in multi-line argument lists (dart format handles this).
- Add new user-visible strings to both `app_en.arb` and `app_zh.arb`, run `flutter gen-l10n`, and
  reference strings through `AppLocalizations` (`context.l10n` helper / `AppLocalizations.of(context)`).
- The controller keeps a bounded log (`_maxLogCount = 200`); trim or rotate if you add log storage.

### Android/Kotlin guidelines

- `minSdk` is 33. Guard API 34+ APIs (e.g. `ACTION_WIFI_P2P_LISTEN_STATE_CHANGED`,
  `EXTRA_LISTEN_STATE`) with `Build.VERSION.SDK_INT >= 34`.
- Permission model on API 33+: use `NEARBY_WIFI_DEVICES` (declared with
  `android:usesPermissionFlags="neverForLocation"`), `ACCESS_WIFI_STATE`, `CHANGE_WIFI_STATE`,
  and `INTERNET`. Do **not** gate Wi-Fi Direct on `ACCESS_FINE_LOCATION` for API 33+.
  Do **not** use `MANAGE_WIFI_NETWORK_SELECTION` or `setConnectionRequestResult()` /
  `addExternalApprover()`; Android documents those as not for third-party apps.
- Do not auto-start `discoverPeers()` on app open; use `startListening()` (API 33+) plus
  `addLocalService()` for availability.
- Do not call `stopListening()` before `connect()`, and do not call `stopListening()` for a
  normal Stop Scan (it also stops peer and service discovery).
- Do not auto-restart discovery while `Connecting`; Android stops discovery during connection setup.
- `connect().onSuccess` means the request was initiated, **not** connected. The only success
  transition is `WIFI_P2P_CONNECTION_CHANGED_ACTION` followed by `requestConnectionInfo()` with
  `groupFormed=true`.
- Cleanup: `cancelConnect()` for a pending negotiation; `removeGroup()` only for a real/stale group.
- Android components: `applicationId`/namespace is `com.involvex.kabelos`. Kotlin files
  live under `kotlin/com/involvex/kabelos/` (not `com/example/...`).

### Native C++ / libopus

- Only touch `cpp/` and `jniLibs/` when working on Audio Link. libopus prebuilts are vendored;
  do not replace them without updating `jniLibs/README.md` provenance info.
- Keep ABIs restricted to `arm64-v8a` and `x86_64` (see `build.gradle.kts` `supportedAbis`).

### Protocol v2

- `protocol/` implements the on-the-wire protocol. `ProtocolConstants.kt` is the source of truth
  for magic, version, ports, and capability strings. Bumping `VERSION` breaks compatibility with
  all older peers — coordinate any change.
- Capability negotiation happens at session setup (`SessionReadyEvent` carries
  `capabilities`/`peerCapabilities`). New features should be negotiated via capability strings.

### Testing

- Keep `flutter test` and `(cd android && ./gradlew testReleaseUnitTest --no-daemon)` green.
  CI runs both.
- The existing Dart test file focuses on pure state/`copyWith` behavior. Prefer testing pure model
  and controller logic without requiring a device; Wi-Fi Direct behavior is verified on hardware.
- Before claiming work is done, run `flutter analyze` and `flutter test` and confirm they pass.

### Building and releasing

- Follow `RELEASING.md` exactly for releases. Highlights:
  - Version format `X.Y.Z+BUILD` in `pubspec.yaml`; `--split-per-abi` adds ABI offsets (e.g. 3.0.0
    → `4001` arm64, `6001` x86_64). Keep matching Fastlane changelogs in
    `fastlane/metadata/android/en-US/changelogs/`.
  - Build only `--target-platform android-arm64,android-x64`. Never upload an `armeabi-v7a` APK.
  - Tag `vX.Y.Z` must point at the exact commit used to build the uploaded APKs.
  - Reproducible builds: CI sets `SOURCE_DATE_EPOCH` from the last commit and pins exact toolchain
    versions; keep those pins in sync when you bump anything.
- Signing secrets come from CI secrets (`ANDROID_KEYSTORE_BASE64`, etc.); never commit
  `android/key.properties`, `*.jks`, or `*.keystore` (they are gitignored).

### Security

- Never commit secrets: keystores, `key.properties`, `.env*`, `google-services.json`.
- Validate file paths and sizes before file transfers; the native side owns
  `ReceiveDestinationManager`/`IncomingPartialFileStore` — keep path handling in the native layer,
  not in Dart.
- Do not weaken permission checks to make Wi-Fi Direct simpler; keep the API 33+ model described
  in `connection_imp_plan.md`.
