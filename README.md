# Kabelos

<p align="center">
  <img src="assets/icon.png" alt="Kabelos icon" width="96">
</p>

<p align="center">
  <strong>Offline peer-to-peer transfer for files, chat, speed tests, and audio over Wi-Fi Direct.</strong>
</p>

<p align="center">
  No internet. No router. No hotspot. Just a direct device-to-device connection.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT license">
  <img src="https://img.shields.io/badge/platform-Android%20%7C%20Windows-brightgreen" alt="Android and Windows">
  <img src="https://img.shields.io/badge/Made%20with-Flutter-blue.svg" alt="Made with Flutter">
  <img src="https://img.shields.io/badge/version-3.0.0-orange.svg" alt="Version 3.0.0">
</p>



## What It Does

Kabelos creates a private local link between nearby devices using Wi-Fi Direct. Once connected, the devices share one negotiated app session for chat, file transfer, speed testing, and audio.

This project is a fork of [jingcjie/WDCable_flutter](https://github.com/jingcjie/WDCable_flutter) with an Android-only build.

## Highlights

- Direct device-to-device connection without internet access.
- High-speed file transfer for local sharing.
- Real-time chat between connected peers.
- Low-latency Audio Link using RTP/RTCP over UDP with libopus.
- Selectable audio quality and latency modes.
- Built-in upload and download speed tests.
- Protocol v2 transport with UDP rendezvous and detailed connection diagnostics.
- Android client with a separate Windows companion app.

## Audio Link Use Case

Use an Android device as a mobile microphone sender and the Windows client as the receiver. Audio Link streams libopus audio over RTP/RTCP and provides selectable quality and latency modes for different network conditions.

| Android Audio Link | Windows Audio Link |
| :---: | :---: |
| <img src="assets/android_audio.png" alt="Android Audio Link screen" width="260"> | <img src="assets/winui_audio.png" alt="Windows Audio Link screen" width="520"> |

## Screenshots

| Connection | Chat | Speed Test | File Transfer |
| :---: | :---: | :---: | :---: |
| <img src="assets/s1.jpg" alt="Connection tab" width="200"> | <img src="assets/s2.jpg" alt="Chat tab" width="200"> | <img src="assets/s3.jpg" alt="Speed Test tab" width="200"> | <img src="assets/s4.jpg" alt="File Transfer tab" width="200"> |


## What's New in 3.0.0

Kabelos 3.0.0 rebrands the app from "WiFi Direct Cable" to Kabelos and adds a simplified interface, QR code pairing, photo sharing, and detailed device info.

- Simple onboarding with automatic setup checks.
- QR code pairing helper to identify devices.
- Photos tab with gallery image selection.
- Setup check screen with "Fix it" buttons.
- Detailed device info and diagnostics.
- German language support.
- Background service status in Settings.
- Simplified interface for everyday sharing.

> [!IMPORTANT]
> Android 3.0.0 supports `arm64-v8a` and `x86_64`. The 32-bit `armeabi-v7a` ABI is not supported.


## Platform Support

| Platform | Status | Repository |
| --- | --- | --- |
| Android | Android 13+; `arm64-v8a` or `x86_64` | This repository |

## Getting Started

### Prerequisites

- Flutter SDK: [installation guide](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code
- An Android device with Wi-Fi Direct support

### Run Locally

```sh
git clone https://github.com/involvex/WDCable_flutter.git
cd WDCable_flutter
flutter pub get
flutter run
```

## Troubleshooting

- Make sure Wi-Fi is enabled on both devices.
- Grant nearby-device, microphone, and notification permissions when Android asks.
- Keep both devices on the connection screen while pairing.
- If discovery fails, turn Wi-Fi off and on, then scan again.

## Coming Soon

- Camera and video streaming over Wi-Fi Direct.

## Contributing

Contributions are welcome. For larger changes, please open an issue first so the implementation can be discussed before a pull request.

```sh
git checkout -b feature/your-feature
git commit -m "Add your feature"
git push origin feature/your-feature
```

Then open a pull request.

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.
