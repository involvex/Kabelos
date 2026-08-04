// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'WiFi Direct Cable';

  @override
  String get wifiP2pDriver => 'WiFi P2P Driver';

  @override
  String get readyForConnections => 'Ready for connections';

  @override
  String get disabledEnableWifi => 'Disabled - Enable WiFi to continue';

  @override
  String get connectionStatus => 'Connection Status';

  @override
  String get connected => 'Connected';

  @override
  String get disconnected => 'Disconnected';

  @override
  String get scanForDevices => 'Scan for Devices';

  @override
  String get scanning => 'Scanning...';

  @override
  String get stopScan => 'Stop Scan';

  @override
  String get deviceInfo => 'Device Info';

  @override
  String get resetWifiDirect => 'Reset WiFi Direct';

  @override
  String get noDevicesFound => 'No devices found';

  @override
  String get tapScanForDevices =>
      'Tap \"Scan for Devices\" to find nearby devices';

  @override
  String availableDevices(int count) {
    return 'Available Devices ($count)';
  }

  @override
  String get connect => 'Connect';

  @override
  String get disconnect => 'Disconnect';

  @override
  String get logs => 'Logs';

  @override
  String get clearLogs => 'Clear Logs';

  @override
  String get chat => 'Chat';

  @override
  String get speedTest => 'Speed Test';

  @override
  String get fileTransfer => 'File Transfer';

  @override
  String get settings => 'Settings';

  @override
  String get connectedReadyToChat => 'Connected - Ready to chat';

  @override
  String get notConnectedConnectToPeer =>
      'Not connected - Connect to a peer to start chatting';

  @override
  String get host => 'Host';

  @override
  String get client => 'Client';

  @override
  String get noMessagesYet => 'No messages yet';

  @override
  String get connectToPeerAndStartChatting =>
      'Connect to a peer and start chatting!';

  @override
  String get typeAMessage => 'Type a message...';

  @override
  String get connectToStartChatting => 'Connect to start chatting';

  @override
  String get justNow => 'Just now';

  @override
  String daysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String minutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String get pleaseConnectToPeerFirst => 'Please connect to a peer first';

  @override
  String fileSent(String fileName) {
    return 'File sent: $fileName';
  }

  @override
  String failedToSendFile(String error) {
    return 'Failed to send file: $error';
  }

  @override
  String get notConnected => 'Not Connected';

  @override
  String get readyForFileTransfer => 'Ready for file transfer';

  @override
  String get connectToStartTransferringFiles =>
      'Connect to start transferring files';

  @override
  String get sendFile => 'Send File';

  @override
  String get receiveFiles => 'Receive Files';

  @override
  String filesWillBeAutomaticallyReceived(String location) {
    return 'Files sent by the peer will be saved to $location';
  }

  @override
  String get saveReceivedFilesTo => 'Save received files to';

  @override
  String get appStorage => 'App storage';

  @override
  String get downloadsFolder => 'Downloads';

  @override
  String get chooseCustomFolder => 'Choose custom folder';

  @override
  String get receiveDestinationFailed => 'Could not use that receive location';

  @override
  String fileReceived(String fileName) {
    return 'File received: $fileName';
  }

  @override
  String fileTransferCancelled(String fileName) {
    return 'Transfer cancelled: $fileName';
  }

  @override
  String fileTransferFailed(String fileName, String error) {
    return 'Transfer failed for $fileName: $error';
  }

  @override
  String get preparing => 'Preparing';

  @override
  String get queued => 'Queued';

  @override
  String get cancelling => 'Cancelling...';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get failed => 'Failed';

  @override
  String get cancel => 'Cancel';

  @override
  String get noActiveTransfers => 'No Active Transfers';

  @override
  String get uploadComplete => 'Upload Complete';

  @override
  String get downloadComplete => 'Download Complete';

  @override
  String get uploading => 'Uploading...';

  @override
  String get downloading => 'Downloading...';

  @override
  String get recentTransfers => 'Recent Transfers';

  @override
  String get noRecentTransfers => 'No recent transfers';

  @override
  String get sent => 'Sent';

  @override
  String get received => 'Received';

  @override
  String get openFile => 'Open file';

  @override
  String get clear => 'Clear';

  @override
  String failedToOpenFile(String error) {
    return 'Failed to open file: $error';
  }

  @override
  String noSupportedAppToOpenFile(String fileName, String location) {
    return 'There is no supported app to open $fileName. It’s saved in $location.';
  }

  @override
  String get systemLogs => 'System Logs';

  @override
  String get noLogsYet => 'No logs yet';

  @override
  String get customizeYourWifiDirectExperience =>
      'Customize your WiFi Direct experience';

  @override
  String get appSettings => 'App Settings';

  @override
  String get language => 'Language';

  @override
  String get chooseYourPreferredLanguage => 'Choose your preferred language';

  @override
  String get followSystem => 'Follow System';

  @override
  String get english => 'English';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get useDarkTheme => 'Use dark theme';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get viewOurPrivacyPolicy => 'View our privacy policy';

  @override
  String get privacyPolicyContent =>
      'This app uses WiFi Direct to establish peer-to-peer connections. No data is sent to external servers. All communications happen directly between devices.';

  @override
  String get ok => 'OK';

  @override
  String get speedTestStatus => 'Speed Test Status';

  @override
  String get readyToTestConnectionSpeed => 'Ready to test connection speed';

  @override
  String get connectToPeerToTestSpeed => 'Connect to a peer to test speed';

  @override
  String get testing => 'Testing...';

  @override
  String get start => 'START';

  @override
  String get tapToStartSpeedTest => 'Tap to start speed test';

  @override
  String get connectToPeerFirst => 'Connect to a peer first';

  @override
  String get downloadTest => 'Download Test';

  @override
  String get uploadTest => 'Upload Test';

  @override
  String get download => 'Download';

  @override
  String get upload => 'Upload';

  @override
  String speed(String speed) {
    return 'Speed: $speed MB/s';
  }

  @override
  String get complete => 'Complete';

  @override
  String get inProgress => 'In Progress';

  @override
  String get latestResults => 'Latest Results';

  @override
  String get testCompletedAt => 'Test completed at';

  @override
  String get noTestResultsYet => 'No test results yet';

  @override
  String get runSpeedTestToSeeResults => 'Run a speed test to see results here';

  @override
  String get testHistory => 'Test History';

  @override
  String tests(int count) {
    return '$count tests';
  }

  @override
  String get noTestHistory => 'No test history';

  @override
  String dayAgo(int count) {
    return '$count day ago';
  }

  @override
  String daysAgoLong(int count) {
    return '$count days ago';
  }

  @override
  String hourAgo(int count) {
    return '$count hour ago';
  }

  @override
  String hoursAgoLong(int count) {
    return '$count hours ago';
  }

  @override
  String minuteAgo(int count) {
    return '$count minute ago';
  }

  @override
  String minutesAgoLong(int count) {
    return '$count minutes ago';
  }

  @override
  String get chinese => '中文';

  @override
  String get githubRepositories => 'GitHub Repositories';

  @override
  String get flutterAppRepository => 'Flutter App Repository';

  @override
  String get flutterAppDescription =>
      'Kabelos - Offline file & photo sharing nearby';

  @override
  String get windowsAppRepository => 'Windows App Repository';

  @override
  String get windowsAppDescription =>
      'WDCableWUI - Windows companion application';

  @override
  String urlCopiedToClipboard(String url) {
    return 'URL copied to clipboard: $url';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSubtitle => 'Customize your WiFi Direct experience';

  @override
  String get audioLink => 'Audio Link';

  @override
  String get audioConnectToPeerFirst => 'Connect to a peer first';

  @override
  String get audioPeerUnsupported =>
      'The connected peer does not support Audio Link';

  @override
  String get audioReady => 'Audio Link is ready';

  @override
  String get audioMode => 'Mode';

  @override
  String get audioReceive => 'Receive';

  @override
  String get audioSend => 'Send';

  @override
  String get audioSource => 'Source';

  @override
  String get audioMicrophone => 'Microphone';

  @override
  String get audioDeviceAudioUnavailable => 'Device audio unavailable';

  @override
  String get audioLatencyMode => 'Latency Mode';

  @override
  String get audioLowLatency => 'Low latency';

  @override
  String get audioStable => 'Stable';

  @override
  String get audioQualityMode => 'Quality';

  @override
  String get audioQualityStandard => 'Standard';

  @override
  String get audioQualityBalanced => 'Balanced';

  @override
  String get audioQualityHigh => 'High';

  @override
  String get audioQualityNearLossless => 'Near lossless';

  @override
  String get audioEncoding => 'Encoding';

  @override
  String get audioOpus => 'Opus';

  @override
  String get audioOpus32Kbps => 'Opus 32 kbps';

  @override
  String get audioOnlyOption => 'Only option';

  @override
  String get audioFollowSenderSide => 'Follow sender side';

  @override
  String get audioStop => 'Stop Audio';

  @override
  String get audioStart => 'Start Audio';

  @override
  String get audioLiveStats => 'Live Stats';

  @override
  String get audioState => 'State';

  @override
  String get audioBitrate => 'Bitrate';

  @override
  String get audioConfiguredBitrate => 'Configured';

  @override
  String get audioQuality => 'Quality';

  @override
  String get audioBuffer => 'Buffer';

  @override
  String get audioDropped => 'Dropped';

  @override
  String get audioPacketLoss => 'Packet Loss';

  @override
  String get audioLateDrops => 'Late Drops';

  @override
  String get audioOverflowDrops => 'Overflow Drops';

  @override
  String get audioPlc => 'PLC';

  @override
  String get audioRtcpLoss => 'RTCP Loss';

  @override
  String get audioRtcpJitter => 'RTCP Jitter';

  @override
  String get audioRoundTrip => 'Round Trip';

  @override
  String get audioFrames => 'Frames';

  @override
  String get audioLatency => 'Latency';

  @override
  String get audioStateReceiveReady => 'Receive ready';

  @override
  String get audioStateOfferSent => 'Offer sent';

  @override
  String get audioStateConnecting => 'Connecting';

  @override
  String get audioStateStreaming => 'Streaming';

  @override
  String get audioStateIdle => 'Idle';

  @override
  String get notAvailableShort => 'N/A';

  @override
  String get kbpsUnit => 'kbps';

  @override
  String get appTitleNew => 'Kabelos';

  @override
  String get appTagline =>
      'Share files between nearby devices — no internet needed';

  @override
  String get onboardingTitle => 'Welcome to Kabelos';

  @override
  String get onboardingSubtitle =>
      'Share photos, files, and more with nearby devices over Wi-Fi Direct';

  @override
  String get onboardingStep1Title => 'Turn on Wi-Fi';

  @override
  String get onboardingStep1Description =>
      'Kabelos uses Wi-Fi Direct to connect directly to nearby devices. No internet, router, or hotspot required.';

  @override
  String get onboardingStep2Title => 'Allow nearby device access';

  @override
  String get onboardingStep2Description =>
      'Android 13+ requires permission to find and connect to nearby devices. This does not use your location.';

  @override
  String get onboardingStep3Title => 'Keep Kabelos running';

  @override
  String get onboardingStep3Description =>
      'Enable the background service so Kabelos stays ready to receive files even when the app is closed. You can change this later in Settings.';

  @override
  String get onboardingStep4Title => 'Samsung One UI note';

  @override
  String get onboardingStep4Description =>
      'On Samsung tablets and phones: open Settings → Connections → More connection settings → Nearby device scanning and turn it ON. Also check Settings → Apps → Kabelos → Permissions → Nearby devices = Allow.';

  @override
  String get onboardingContinue => 'Continue';

  @override
  String get onboardingFinish => 'Finish setup';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingChecking => 'Checking setup...';

  @override
  String get onboardingCheckPassed => 'Setup looks good!';

  @override
  String get onboardingCheckFailed => 'Some items need attention';

  @override
  String get setupCheckTitle => 'Setup Check';

  @override
  String get setupCheckSubtitle =>
      'Verify Kabelos is ready to send and receive';

  @override
  String get setupCheckRunning => 'Running checks...';

  @override
  String get setupCheckItemWifiOn => 'Wi-Fi is on';

  @override
  String get setupCheckItemWifiDirectReady => 'Wi-Fi Direct is ready';

  @override
  String get setupCheckItemNearbyPermission =>
      'Nearby devices permission granted';

  @override
  String get setupCheckItemForegroundService => 'Background service is running';

  @override
  String get setupCheckItemWifiLock => 'Wi-Fi lock is held';

  @override
  String get setupCheckItemWakeLock => 'Wake lock is held';

  @override
  String get setupCheckItemSamsungNearbyScanning =>
      'Samsung Nearby device scanning is ON';

  @override
  String get setupCheckPass => 'Pass';

  @override
  String get setupCheckFail => 'Needs attention';

  @override
  String get setupCheckFixIt => 'Fix it';

  @override
  String get setupCheckAllGood => 'All checks passed — Kabelos is ready!';

  @override
  String get setupCheckSomeFailed =>
      'Some checks failed. Tap \"Fix it\" to resolve.';

  @override
  String get qrPairingTitle => 'QR Pairing Helper';

  @override
  String get qrPairingSubtitle =>
      'Show or scan a code to identify the other device';

  @override
  String get qrPairingShowCode => 'Show my code';

  @override
  String get qrPairingScanCode => 'Scan other device';

  @override
  String get qrPairingYourCode => 'Your Kabelos code';

  @override
  String get qrPairingDeviceName => 'Device name';

  @override
  String get qrPairingPairingCode => 'Pairing code';

  @override
  String get qrPairingNote =>
      'This code helps you identify the right device. You still need to tap \"Connect\" in the device list. Wi-Fi Direct does not allow automatic pairing by code alone.';

  @override
  String get qrPairingScanning => 'Point camera at the other device\'s QR code';

  @override
  String qrPairingScanResult(String name, String code) {
    return 'Found: $name ($code)';
  }

  @override
  String get qrPairingPermissionCamera =>
      'Camera permission needed to scan QR codes';

  @override
  String get photoPickerTitle => 'Send Photos';

  @override
  String get photoPickerSubtitle => 'Select photos from your library to send';

  @override
  String get photoPickerSelectPhotos => 'Select photos';

  @override
  String get photoPickerNoPhotosSelected => 'No photos selected';

  @override
  String photoPickerSelectedCount(int count) {
    return '$count photo(s) selected';
  }

  @override
  String photoPickerSend(int count) {
    return 'Send $count photo(s)';
  }

  @override
  String get photoPickerPermissionPhotos =>
      'Photos permission needed to access your library';

  @override
  String get deviceInfoTitle => 'Device Information';

  @override
  String get deviceInfoSubtitle =>
      'Details about this device and the Wi-Fi Direct connection';

  @override
  String get deviceInfoThisDevice => 'This Device';

  @override
  String get deviceInfoConnectedPeer => 'Connected Peer';

  @override
  String get deviceInfoDeviceName => 'Device name';

  @override
  String get deviceInfoModel => 'Model';

  @override
  String get deviceInfoAndroidVersion => 'Android version';

  @override
  String get deviceInfoAppVersion => 'App version';

  @override
  String get deviceInfoWifiDirectStatus => 'Wi-Fi Direct status';

  @override
  String get deviceInfoIsGroupOwner => 'Group owner';

  @override
  String get deviceInfoGroupOwner => 'Group Owner';

  @override
  String get deviceInfoClient => 'Client';

  @override
  String get deviceInfoNetworkAddress => 'Network address';

  @override
  String get deviceInfoPassphrase => 'Passphrase';

  @override
  String get deviceInfoFrequency => 'Frequency';

  @override
  String get deviceInfoWifiState => 'Wi-Fi state';

  @override
  String get deviceInfoForegroundService => 'Background service';

  @override
  String get deviceInfoWifiLock => 'Wi-Fi lock';

  @override
  String get deviceInfoWakeLock => 'Wake lock';

  @override
  String get deviceInfoRunning => 'Running';

  @override
  String get deviceInfoStopped => 'Stopped';

  @override
  String get deviceInfoHeld => 'Held';

  @override
  String get deviceInfoNotHeld => 'Not held';

  @override
  String get deviceInfoPeerCapabilities => 'Peer capabilities';

  @override
  String get deviceInfoSessionCapabilities => 'Session capabilities';

  @override
  String get deviceInfoCopy => 'Copy details';

  @override
  String get deviceInfoCopied => 'Copied to clipboard';

  @override
  String get servicePromptTitle => 'Keep Kabelos running?';

  @override
  String get servicePromptDescription =>
      'Keep Kabelos running in the background so you can receive files even when the app is closed. A persistent notification will show the status.';

  @override
  String get servicePromptEnable => 'Enable background service';

  @override
  String get servicePromptDisable => 'Disable background service';

  @override
  String get servicePromptRunning => 'Background service is running';

  @override
  String get servicePromptStopped => 'Background service is stopped';

  @override
  String get servicePromptLearnMore => 'Learn more';

  @override
  String get servicePromptDismiss => 'Not now';

  @override
  String get settingsShowChat => 'Show Chat tab';

  @override
  String get settingsShowAudioLink => 'Show Audio Link tab';

  @override
  String get settingsShowSpeedTest => 'Show Speed Test tab';

  @override
  String get settingsKeepServiceRunning => 'Keep Kabelos running in background';

  @override
  String get settingsKeepServiceRunningDescription =>
      'When enabled, Kabelos runs a background service to receive files even when the app is closed. Shows a persistent notification.';

  @override
  String get settingsTabsVisibility => 'Visible tabs';

  @override
  String get connectionTabTitle => 'Devices';

  @override
  String get connectionTabSubtitle => 'Find and connect to nearby devices';

  @override
  String connectionStatusConnected(String name) {
    return 'Connected to $name';
  }

  @override
  String get connectionStatusReady => 'Ready — Wi-Fi Direct is on';

  @override
  String get connectionStatusWifiOff =>
      'Wi-Fi is off — Turn on Wi-Fi to continue';

  @override
  String get connectionStatusDisabled => 'Disabled — Check settings';

  @override
  String get connectionSetupCheck => 'Setup check';

  @override
  String get connectionQrPairing => 'QR pairing';

  @override
  String get connectionDeviceInfo => 'Device info';

  @override
  String get filesTabTitle => 'Files';

  @override
  String get photosTabTitle => 'Photos';

  @override
  String get wifiSettingsOpened => 'Opening Wi-Fi settings...';

  @override
  String get nearbyDevicesSettingsOpened =>
      'Opening Nearby devices settings...';

  @override
  String get samsungNearbyScanningSettingsOpened =>
      'Opening Samsung Nearby scanning settings...';

  @override
  String get appSettingsOpened => 'Opening app permissions...';
}
