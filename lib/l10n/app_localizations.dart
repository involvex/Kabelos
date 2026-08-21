import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('zh'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'WiFi Direct Cable'**
  String get appTitle;

  /// WiFi P2P driver status label
  ///
  /// In en, this message translates to:
  /// **'WiFi P2P Driver'**
  String get wifiP2pDriver;

  /// Status when WiFi P2P is enabled
  ///
  /// In en, this message translates to:
  /// **'Ready for connections'**
  String get readyForConnections;

  /// Status when WiFi P2P is disabled
  ///
  /// In en, this message translates to:
  /// **'Disabled - Enable WiFi to continue'**
  String get disabledEnableWifi;

  /// Connection status label
  ///
  /// In en, this message translates to:
  /// **'Connection Status'**
  String get connectionStatus;

  /// Connected status
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// Disconnected status
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get disconnected;

  /// Button text to scan for devices
  ///
  /// In en, this message translates to:
  /// **'Scan for Devices'**
  String get scanForDevices;

  /// Text shown when scanning for devices
  ///
  /// In en, this message translates to:
  /// **'Scanning...'**
  String get scanning;

  /// Button text to stop scanning
  ///
  /// In en, this message translates to:
  /// **'Stop Scan'**
  String get stopScan;

  /// Button text to show device information
  ///
  /// In en, this message translates to:
  /// **'Device Info'**
  String get deviceInfo;

  /// Button text to reset WiFi Direct
  ///
  /// In en, this message translates to:
  /// **'Reset WiFi Direct'**
  String get resetWifiDirect;

  /// Message when no devices are found
  ///
  /// In en, this message translates to:
  /// **'No devices found'**
  String get noDevicesFound;

  /// Instruction text for scanning devices
  ///
  /// In en, this message translates to:
  /// **'Tap \"Scan for Devices\" to find nearby devices'**
  String get tapScanForDevices;

  /// Header for available devices list
  ///
  /// In en, this message translates to:
  /// **'Available Devices ({count})'**
  String availableDevices(int count);

  /// Button text to connect to a device
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// Button text to disconnect from a device
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get disconnect;

  /// Logs section header
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// Button text to clear logs
  ///
  /// In en, this message translates to:
  /// **'Clear Logs'**
  String get clearLogs;

  /// Chat tab label
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// Speed test label in chat
  ///
  /// In en, this message translates to:
  /// **'Speed Test'**
  String get speedTest;

  /// File transfer tab label
  ///
  /// In en, this message translates to:
  /// **'File Transfer'**
  String get fileTransfer;

  /// Settings tab label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Status when connected and ready to chat
  ///
  /// In en, this message translates to:
  /// **'Connected - Ready to chat'**
  String get connectedReadyToChat;

  /// Status when not connected to peer
  ///
  /// In en, this message translates to:
  /// **'Not connected - Connect to a peer to start chatting'**
  String get notConnectedConnectToPeer;

  /// Host role indicator
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get host;

  /// Client role indicator
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get client;

  /// Message when no chat messages exist
  ///
  /// In en, this message translates to:
  /// **'No messages yet'**
  String get noMessagesYet;

  /// Instruction to connect and start chatting
  ///
  /// In en, this message translates to:
  /// **'Connect to a peer and start chatting!'**
  String get connectToPeerAndStartChatting;

  /// Chat input placeholder when connected
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get typeAMessage;

  /// Chat input placeholder when not connected
  ///
  /// In en, this message translates to:
  /// **'Connect to start chatting'**
  String get connectToStartChatting;

  /// Timestamp for very recent messages
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// Days ago timestamp
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String daysAgo(int count);

  /// Hours ago timestamp
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String hoursAgo(int count);

  /// Minutes ago timestamp
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String minutesAgo(int count);

  /// Error message when trying to send file without connection
  ///
  /// In en, this message translates to:
  /// **'Please connect to a peer first'**
  String get pleaseConnectToPeerFirst;

  /// Success message when file is sent
  ///
  /// In en, this message translates to:
  /// **'File sent: {fileName}'**
  String fileSent(String fileName);

  /// Error message when file send fails
  ///
  /// In en, this message translates to:
  /// **'Failed to send file: {error}'**
  String failedToSendFile(String error);

  /// Connection status when not connected
  ///
  /// In en, this message translates to:
  /// **'Not Connected'**
  String get notConnected;

  /// Status when ready for file transfer
  ///
  /// In en, this message translates to:
  /// **'Ready for file transfer'**
  String get readyForFileTransfer;

  /// Instruction when not connected
  ///
  /// In en, this message translates to:
  /// **'Connect to start transferring files'**
  String get connectToStartTransferringFiles;

  /// Send file button text
  ///
  /// In en, this message translates to:
  /// **'Send File'**
  String get sendFile;

  /// Receive files section title
  ///
  /// In en, this message translates to:
  /// **'Receive Files'**
  String get receiveFiles;

  /// Description of automatic file receiving
  ///
  /// In en, this message translates to:
  /// **'Files sent by the peer will be saved to {location}'**
  String filesWillBeAutomaticallyReceived(String location);

  /// No description provided for @saveReceivedFilesTo.
  ///
  /// In en, this message translates to:
  /// **'Save received files to'**
  String get saveReceivedFilesTo;

  /// No description provided for @appStorage.
  ///
  /// In en, this message translates to:
  /// **'App storage'**
  String get appStorage;

  /// No description provided for @downloadsFolder.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloadsFolder;

  /// No description provided for @chooseCustomFolder.
  ///
  /// In en, this message translates to:
  /// **'Choose custom folder'**
  String get chooseCustomFolder;

  /// No description provided for @receiveDestinationFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not use that receive location'**
  String get receiveDestinationFailed;

  /// No description provided for @fileReceived.
  ///
  /// In en, this message translates to:
  /// **'File received: {fileName}'**
  String fileReceived(String fileName);

  /// No description provided for @fileTransferCancelled.
  ///
  /// In en, this message translates to:
  /// **'Transfer cancelled: {fileName}'**
  String fileTransferCancelled(String fileName);

  /// No description provided for @fileTransferFailed.
  ///
  /// In en, this message translates to:
  /// **'Transfer failed for {fileName}: {error}'**
  String fileTransferFailed(String fileName, String error);

  /// No description provided for @preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing'**
  String get preparing;

  /// No description provided for @queued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get queued;

  /// No description provided for @cancelling.
  ///
  /// In en, this message translates to:
  /// **'Cancelling...'**
  String get cancelling;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Message when no file transfers are active
  ///
  /// In en, this message translates to:
  /// **'No Active Transfers'**
  String get noActiveTransfers;

  /// Status when upload is complete
  ///
  /// In en, this message translates to:
  /// **'Upload Complete'**
  String get uploadComplete;

  /// Status when download is complete
  ///
  /// In en, this message translates to:
  /// **'Download Complete'**
  String get downloadComplete;

  /// Status when uploading
  ///
  /// In en, this message translates to:
  /// **'Uploading...'**
  String get uploading;

  /// Status when downloading
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get downloading;

  /// Recent transfers section title
  ///
  /// In en, this message translates to:
  /// **'Recent Transfers'**
  String get recentTransfers;

  /// Message when no recent transfers exist
  ///
  /// In en, this message translates to:
  /// **'No recent transfers'**
  String get noRecentTransfers;

  /// Label for sent files
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get sent;

  /// Label for received files
  ///
  /// In en, this message translates to:
  /// **'Received'**
  String get received;

  /// Tooltip for open file button
  ///
  /// In en, this message translates to:
  /// **'Open file'**
  String get openFile;

  /// Tooltip for clear button
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// Error message when file open fails
  ///
  /// In en, this message translates to:
  /// **'Failed to open file: {error}'**
  String failedToOpenFile(String error);

  /// Informational message when no installed app supports a received file
  ///
  /// In en, this message translates to:
  /// **'There is no supported app to open {fileName}. It’s saved in {location}.'**
  String noSupportedAppToOpenFile(String fileName, String location);

  /// System logs section header
  ///
  /// In en, this message translates to:
  /// **'System Logs'**
  String get systemLogs;

  /// Message when no logs exist
  ///
  /// In en, this message translates to:
  /// **'No logs yet'**
  String get noLogsYet;

  /// Settings page subtitle
  ///
  /// In en, this message translates to:
  /// **'Customize your WiFi Direct experience'**
  String get customizeYourWifiDirectExperience;

  /// App settings section title
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// Language setting title
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Language setting description
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language'**
  String get chooseYourPreferredLanguage;

  /// Follow system language option
  ///
  /// In en, this message translates to:
  /// **'Follow System'**
  String get followSystem;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Dark mode setting title
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Dark mode setting description
  ///
  /// In en, this message translates to:
  /// **'Use dark theme'**
  String get useDarkTheme;

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Version info title
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Privacy policy title
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Privacy policy description
  ///
  /// In en, this message translates to:
  /// **'View our privacy policy'**
  String get viewOurPrivacyPolicy;

  /// Privacy policy dialog content
  ///
  /// In en, this message translates to:
  /// **'This app uses WiFi Direct to establish peer-to-peer connections. No data is sent to external servers. All communications happen directly between devices.'**
  String get privacyPolicyContent;

  /// OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Speed test status title
  ///
  /// In en, this message translates to:
  /// **'Speed Test Status'**
  String get speedTestStatus;

  /// Status when ready to test speed
  ///
  /// In en, this message translates to:
  /// **'Ready to test connection speed'**
  String get readyToTestConnectionSpeed;

  /// Status when not connected for speed test
  ///
  /// In en, this message translates to:
  /// **'Connect to a peer to test speed'**
  String get connectToPeerToTestSpeed;

  /// Speed test in progress text
  ///
  /// In en, this message translates to:
  /// **'Testing...'**
  String get testing;

  /// Start speed test button text
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get start;

  /// Instruction to start speed test
  ///
  /// In en, this message translates to:
  /// **'Tap to start speed test'**
  String get tapToStartSpeedTest;

  /// Instruction when not connected
  ///
  /// In en, this message translates to:
  /// **'Connect to a peer first'**
  String get connectToPeerFirst;

  /// Download test phase label
  ///
  /// In en, this message translates to:
  /// **'Download Test'**
  String get downloadTest;

  /// Upload test phase label
  ///
  /// In en, this message translates to:
  /// **'Upload Test'**
  String get uploadTest;

  /// Download label
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// Upload label
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// Speed display format
  ///
  /// In en, this message translates to:
  /// **'Speed: {speed} MB/s'**
  String speed(String speed);

  /// Complete status
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// In progress status
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// Latest results section title
  ///
  /// In en, this message translates to:
  /// **'Latest Results'**
  String get latestResults;

  /// Test completion time label
  ///
  /// In en, this message translates to:
  /// **'Test completed at'**
  String get testCompletedAt;

  /// Message when no test results exist
  ///
  /// In en, this message translates to:
  /// **'No test results yet'**
  String get noTestResultsYet;

  /// Instruction to run speed test
  ///
  /// In en, this message translates to:
  /// **'Run a speed test to see results here'**
  String get runSpeedTestToSeeResults;

  /// Test history section title
  ///
  /// In en, this message translates to:
  /// **'Test History'**
  String get testHistory;

  /// Number of tests format
  ///
  /// In en, this message translates to:
  /// **'{count} tests'**
  String tests(int count);

  /// Message when no test history exists
  ///
  /// In en, this message translates to:
  /// **'No test history'**
  String get noTestHistory;

  /// Single day ago format
  ///
  /// In en, this message translates to:
  /// **'{count} day ago'**
  String dayAgo(int count);

  /// Multiple days ago format
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgoLong(int count);

  /// Single hour ago format
  ///
  /// In en, this message translates to:
  /// **'{count} hour ago'**
  String hourAgo(int count);

  /// Multiple hours ago format
  ///
  /// In en, this message translates to:
  /// **'{count} hours ago'**
  String hoursAgoLong(int count);

  /// Single minute ago format
  ///
  /// In en, this message translates to:
  /// **'{count} minute ago'**
  String minuteAgo(int count);

  /// Multiple minutes ago format
  ///
  /// In en, this message translates to:
  /// **'{count} minutes ago'**
  String minutesAgoLong(int count);

  /// Chinese language option
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get chinese;

  /// GitHub repositories section title
  ///
  /// In en, this message translates to:
  /// **'GitHub Repositories'**
  String get githubRepositories;

  /// Flutter app repository title
  ///
  /// In en, this message translates to:
  /// **'Flutter App Repository'**
  String get flutterAppRepository;

  /// Flutter app repository description
  ///
  /// In en, this message translates to:
  /// **'Kabelos - Offline file & photo sharing nearby'**
  String get flutterAppDescription;

  /// Windows app repository title
  ///
  /// In en, this message translates to:
  /// **'Windows App Repository'**
  String get windowsAppRepository;

  /// Windows app repository description
  ///
  /// In en, this message translates to:
  /// **'WDCableWUI - Windows companion application'**
  String get windowsAppDescription;

  /// Message shown when URL is copied to clipboard
  ///
  /// In en, this message translates to:
  /// **'URL copied to clipboard: {url}'**
  String urlCopiedToClipboard(String url);

  /// Settings page title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Settings page subtitle
  ///
  /// In en, this message translates to:
  /// **'Customize your WiFi Direct experience'**
  String get settingsSubtitle;

  /// No description provided for @audioLink.
  ///
  /// In en, this message translates to:
  /// **'Audio Link'**
  String get audioLink;

  /// No description provided for @audioConnectToPeerFirst.
  ///
  /// In en, this message translates to:
  /// **'Connect to a peer first'**
  String get audioConnectToPeerFirst;

  /// No description provided for @audioPeerUnsupported.
  ///
  /// In en, this message translates to:
  /// **'The connected peer does not support Audio Link'**
  String get audioPeerUnsupported;

  /// No description provided for @audioReady.
  ///
  /// In en, this message translates to:
  /// **'Audio Link is ready'**
  String get audioReady;

  /// No description provided for @audioMode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get audioMode;

  /// No description provided for @audioReceive.
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get audioReceive;

  /// No description provided for @audioSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get audioSend;

  /// No description provided for @audioSource.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get audioSource;

  /// No description provided for @audioMicrophone.
  ///
  /// In en, this message translates to:
  /// **'Microphone'**
  String get audioMicrophone;

  /// No description provided for @audioDeviceAudioUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Device audio unavailable'**
  String get audioDeviceAudioUnavailable;

  /// No description provided for @audioLatencyMode.
  ///
  /// In en, this message translates to:
  /// **'Latency Mode'**
  String get audioLatencyMode;

  /// No description provided for @audioLowLatency.
  ///
  /// In en, this message translates to:
  /// **'Low latency'**
  String get audioLowLatency;

  /// No description provided for @audioStable.
  ///
  /// In en, this message translates to:
  /// **'Stable'**
  String get audioStable;

  /// No description provided for @audioQualityMode.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get audioQualityMode;

  /// No description provided for @audioQualityStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get audioQualityStandard;

  /// No description provided for @audioQualityBalanced.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get audioQualityBalanced;

  /// No description provided for @audioQualityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get audioQualityHigh;

  /// No description provided for @audioQualityNearLossless.
  ///
  /// In en, this message translates to:
  /// **'Near lossless'**
  String get audioQualityNearLossless;

  /// No description provided for @audioEncoding.
  ///
  /// In en, this message translates to:
  /// **'Encoding'**
  String get audioEncoding;

  /// No description provided for @audioOpus.
  ///
  /// In en, this message translates to:
  /// **'Opus'**
  String get audioOpus;

  /// No description provided for @audioOpus32Kbps.
  ///
  /// In en, this message translates to:
  /// **'Opus 32 kbps'**
  String get audioOpus32Kbps;

  /// No description provided for @audioOnlyOption.
  ///
  /// In en, this message translates to:
  /// **'Only option'**
  String get audioOnlyOption;

  /// No description provided for @audioFollowSenderSide.
  ///
  /// In en, this message translates to:
  /// **'Follow sender side'**
  String get audioFollowSenderSide;

  /// No description provided for @audioStop.
  ///
  /// In en, this message translates to:
  /// **'Stop Audio'**
  String get audioStop;

  /// No description provided for @audioStart.
  ///
  /// In en, this message translates to:
  /// **'Start Audio'**
  String get audioStart;

  /// No description provided for @audioLiveStats.
  ///
  /// In en, this message translates to:
  /// **'Live Stats'**
  String get audioLiveStats;

  /// No description provided for @audioState.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get audioState;

  /// No description provided for @audioBitrate.
  ///
  /// In en, this message translates to:
  /// **'Bitrate'**
  String get audioBitrate;

  /// No description provided for @audioConfiguredBitrate.
  ///
  /// In en, this message translates to:
  /// **'Configured'**
  String get audioConfiguredBitrate;

  /// No description provided for @audioQuality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get audioQuality;

  /// No description provided for @audioBuffer.
  ///
  /// In en, this message translates to:
  /// **'Buffer'**
  String get audioBuffer;

  /// No description provided for @audioDropped.
  ///
  /// In en, this message translates to:
  /// **'Dropped'**
  String get audioDropped;

  /// No description provided for @audioPacketLoss.
  ///
  /// In en, this message translates to:
  /// **'Packet Loss'**
  String get audioPacketLoss;

  /// No description provided for @audioLateDrops.
  ///
  /// In en, this message translates to:
  /// **'Late Drops'**
  String get audioLateDrops;

  /// No description provided for @audioOverflowDrops.
  ///
  /// In en, this message translates to:
  /// **'Overflow Drops'**
  String get audioOverflowDrops;

  /// No description provided for @audioPlc.
  ///
  /// In en, this message translates to:
  /// **'PLC'**
  String get audioPlc;

  /// No description provided for @audioRtcpLoss.
  ///
  /// In en, this message translates to:
  /// **'RTCP Loss'**
  String get audioRtcpLoss;

  /// No description provided for @audioRtcpJitter.
  ///
  /// In en, this message translates to:
  /// **'RTCP Jitter'**
  String get audioRtcpJitter;

  /// No description provided for @audioRoundTrip.
  ///
  /// In en, this message translates to:
  /// **'Round Trip'**
  String get audioRoundTrip;

  /// No description provided for @audioFrames.
  ///
  /// In en, this message translates to:
  /// **'Frames'**
  String get audioFrames;

  /// No description provided for @audioLatency.
  ///
  /// In en, this message translates to:
  /// **'Latency'**
  String get audioLatency;

  /// No description provided for @audioStateReceiveReady.
  ///
  /// In en, this message translates to:
  /// **'Receive ready'**
  String get audioStateReceiveReady;

  /// No description provided for @audioStateOfferSent.
  ///
  /// In en, this message translates to:
  /// **'Offer sent'**
  String get audioStateOfferSent;

  /// No description provided for @audioStateConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting'**
  String get audioStateConnecting;

  /// No description provided for @audioStateStreaming.
  ///
  /// In en, this message translates to:
  /// **'Streaming'**
  String get audioStateStreaming;

  /// No description provided for @audioStateIdle.
  ///
  /// In en, this message translates to:
  /// **'Idle'**
  String get audioStateIdle;

  /// No description provided for @notAvailableShort.
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailableShort;

  /// No description provided for @kbpsUnit.
  ///
  /// In en, this message translates to:
  /// **'kbps'**
  String get kbpsUnit;

  /// New app title for Kabelos rebrand
  ///
  /// In en, this message translates to:
  /// **'Kabelos'**
  String get appTitleNew;

  /// Short tagline for app store and onboarding
  ///
  /// In en, this message translates to:
  /// **'Share files between nearby devices — no internet needed'**
  String get appTagline;

  /// Onboarding screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome to Kabelos'**
  String get onboardingTitle;

  /// Onboarding screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Share photos, files, and more with nearby devices over Wi-Fi Direct'**
  String get onboardingSubtitle;

  /// Onboarding step 1 title
  ///
  /// In en, this message translates to:
  /// **'Turn on Wi-Fi'**
  String get onboardingStep1Title;

  /// Onboarding step 1 description
  ///
  /// In en, this message translates to:
  /// **'Kabelos uses Wi-Fi Direct to connect directly to nearby devices. No internet, router, or hotspot required.'**
  String get onboardingStep1Description;

  /// Onboarding step 2 title
  ///
  /// In en, this message translates to:
  /// **'Allow nearby device access'**
  String get onboardingStep2Title;

  /// Onboarding step 2 description
  ///
  /// In en, this message translates to:
  /// **'Android 13+ requires permission to find and connect to nearby devices. This does not use your location.'**
  String get onboardingStep2Description;

  /// Onboarding step 3 title
  ///
  /// In en, this message translates to:
  /// **'Keep Kabelos running'**
  String get onboardingStep3Title;

  /// Onboarding step 3 description
  ///
  /// In en, this message translates to:
  /// **'Enable the background service so Kabelos stays ready to receive files even when the app is closed. You can change this later in Settings.'**
  String get onboardingStep3Description;

  /// Onboarding step 4 title for Samsung devices
  ///
  /// In en, this message translates to:
  /// **'Samsung One UI note'**
  String get onboardingStep4Title;

  /// Onboarding step 4 description for Samsung One UI specific settings
  ///
  /// In en, this message translates to:
  /// **'On Samsung tablets and phones: open Settings → Connections → More connection settings → Nearby device scanning and turn it ON. Also check Settings → Apps → Kabelos → Permissions → Nearby devices = Allow.'**
  String get onboardingStep4Description;

  /// Onboarding continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContinue;

  /// Onboarding finish button
  ///
  /// In en, this message translates to:
  /// **'Finish setup'**
  String get onboardingFinish;

  /// Onboarding skip button
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// Onboarding auto-check status
  ///
  /// In en, this message translates to:
  /// **'Checking setup...'**
  String get onboardingChecking;

  /// Onboarding check passed message
  ///
  /// In en, this message translates to:
  /// **'Setup looks good!'**
  String get onboardingCheckPassed;

  /// Onboarding check failed message
  ///
  /// In en, this message translates to:
  /// **'Some items need attention'**
  String get onboardingCheckFailed;

  /// Setup check screen title
  ///
  /// In en, this message translates to:
  /// **'Setup Check'**
  String get setupCheckTitle;

  /// Setup check screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Verify Kabelos is ready to send and receive'**
  String get setupCheckSubtitle;

  /// Setup check running status
  ///
  /// In en, this message translates to:
  /// **'Running checks...'**
  String get setupCheckRunning;

  /// Setup check item: Wi-Fi enabled
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi is on'**
  String get setupCheckItemWifiOn;

  /// Setup check item: Wi-Fi Direct driver ready
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi Direct is ready'**
  String get setupCheckItemWifiDirectReady;

  /// Setup check item: nearby devices permission
  ///
  /// In en, this message translates to:
  /// **'Nearby devices permission granted'**
  String get setupCheckItemNearbyPermission;

  /// Setup check item: foreground service running
  ///
  /// In en, this message translates to:
  /// **'Background service is running'**
  String get setupCheckItemForegroundService;

  /// Setup check item: Wi-Fi lock held
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi lock is held'**
  String get setupCheckItemWifiLock;

  /// Setup check item: wake lock held
  ///
  /// In en, this message translates to:
  /// **'Wake lock is held'**
  String get setupCheckItemWakeLock;

  /// Setup check item: Samsung nearby scanning
  ///
  /// In en, this message translates to:
  /// **'Samsung Nearby device scanning is ON'**
  String get setupCheckItemSamsungNearbyScanning;

  /// Setup check item passed
  ///
  /// In en, this message translates to:
  /// **'Pass'**
  String get setupCheckPass;

  /// Setup check item failed
  ///
  /// In en, this message translates to:
  /// **'Needs attention'**
  String get setupCheckFail;

  /// Button to open settings to fix a failed check
  ///
  /// In en, this message translates to:
  /// **'Fix it'**
  String get setupCheckFixIt;

  /// Message when all setup checks pass
  ///
  /// In en, this message translates to:
  /// **'All checks passed — Kabelos is ready!'**
  String get setupCheckAllGood;

  /// Message when some checks fail
  ///
  /// In en, this message translates to:
  /// **'Some checks failed. Tap \"Fix it\" to resolve.'**
  String get setupCheckSomeFailed;

  /// QR pairing screen title
  ///
  /// In en, this message translates to:
  /// **'QR Pairing Helper'**
  String get qrPairingTitle;

  /// QR pairing screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Show or scan a code to identify the other device'**
  String get qrPairingSubtitle;

  /// Button to show QR code with device identity
  ///
  /// In en, this message translates to:
  /// **'Show my code'**
  String get qrPairingShowCode;

  /// Button to scan another device's QR code
  ///
  /// In en, this message translates to:
  /// **'Scan other device'**
  String get qrPairingScanCode;

  /// Label for displayed QR code
  ///
  /// In en, this message translates to:
  /// **'Your Kabelos code'**
  String get qrPairingYourCode;

  /// Label for device name in QR code
  ///
  /// In en, this message translates to:
  /// **'Device name'**
  String get qrPairingDeviceName;

  /// Label for 8-digit pairing code
  ///
  /// In en, this message translates to:
  /// **'Pairing code'**
  String get qrPairingPairingCode;

  /// Honest disclaimer about QR code limitations
  ///
  /// In en, this message translates to:
  /// **'This code helps you identify the right device. You still need to tap \"Connect\" in the device list. Wi-Fi Direct does not allow automatic pairing by code alone.'**
  String get qrPairingNote;

  /// Scanning instruction
  ///
  /// In en, this message translates to:
  /// **'Point camera at the other device\'s QR code'**
  String get qrPairingScanning;

  /// Scan result format
  ///
  /// In en, this message translates to:
  /// **'Found: {name} ({code})'**
  String qrPairingScanResult(String name, String code);

  /// Camera permission rationale
  ///
  /// In en, this message translates to:
  /// **'Camera permission needed to scan QR codes'**
  String get qrPairingPermissionCamera;

  /// Photo picker tab title
  ///
  /// In en, this message translates to:
  /// **'Send Photos'**
  String get photoPickerTitle;

  /// Photo picker tab subtitle
  ///
  /// In en, this message translates to:
  /// **'Select photos from your library to send'**
  String get photoPickerSubtitle;

  /// Button to open photo library
  ///
  /// In en, this message translates to:
  /// **'Select photos'**
  String get photoPickerSelectPhotos;

  /// Message when no photos picked
  ///
  /// In en, this message translates to:
  /// **'No photos selected'**
  String get photoPickerNoPhotosSelected;

  /// Selected photo count
  ///
  /// In en, this message translates to:
  /// **'{count} photo(s) selected'**
  String photoPickerSelectedCount(int count);

  /// Send selected photos button
  ///
  /// In en, this message translates to:
  /// **'Send {count} photo(s)'**
  String photoPickerSend(int count);

  /// Photos permission rationale
  ///
  /// In en, this message translates to:
  /// **'Photos permission needed to access your library'**
  String get photoPickerPermissionPhotos;

  /// Snackbar shown when user taps Send before a session is established
  ///
  /// In en, this message translates to:
  /// **'Connect to a peer first'**
  String get photoPickerSendNotConnected;

  /// Device info screen title
  ///
  /// In en, this message translates to:
  /// **'Device Information'**
  String get deviceInfoTitle;

  /// Device info screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Details about this device and the Wi-Fi Direct connection'**
  String get deviceInfoSubtitle;

  /// Section title for local device info
  ///
  /// In en, this message translates to:
  /// **'This Device'**
  String get deviceInfoThisDevice;

  /// Section title for connected peer info
  ///
  /// In en, this message translates to:
  /// **'Connected Peer'**
  String get deviceInfoConnectedPeer;

  /// Device name label
  ///
  /// In en, this message translates to:
  /// **'Device name'**
  String get deviceInfoDeviceName;

  /// Device model label
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get deviceInfoModel;

  /// Android version label
  ///
  /// In en, this message translates to:
  /// **'Android version'**
  String get deviceInfoAndroidVersion;

  /// App version label
  ///
  /// In en, this message translates to:
  /// **'App version'**
  String get deviceInfoAppVersion;

  /// Wi-Fi Direct status label
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi Direct status'**
  String get deviceInfoWifiDirectStatus;

  /// Group owner label
  ///
  /// In en, this message translates to:
  /// **'Group owner'**
  String get deviceInfoIsGroupOwner;

  /// Group owner value: yes
  ///
  /// In en, this message translates to:
  /// **'Group Owner'**
  String get deviceInfoGroupOwner;

  /// Group owner value: no
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get deviceInfoClient;

  /// Network address label
  ///
  /// In en, this message translates to:
  /// **'Network address'**
  String get deviceInfoNetworkAddress;

  /// Passphrase label
  ///
  /// In en, this message translates to:
  /// **'Passphrase'**
  String get deviceInfoPassphrase;

  /// Wi-Fi frequency label
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get deviceInfoFrequency;

  /// Wi-Fi state label
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi state'**
  String get deviceInfoWifiState;

  /// Foreground service label
  ///
  /// In en, this message translates to:
  /// **'Background service'**
  String get deviceInfoForegroundService;

  /// Wi-Fi lock label
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi lock'**
  String get deviceInfoWifiLock;

  /// Wake lock label
  ///
  /// In en, this message translates to:
  /// **'Wake lock'**
  String get deviceInfoWakeLock;

  /// Service running status
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get deviceInfoRunning;

  /// Service stopped status
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get deviceInfoStopped;

  /// Lock held status
  ///
  /// In en, this message translates to:
  /// **'Held'**
  String get deviceInfoHeld;

  /// Lock not held status
  ///
  /// In en, this message translates to:
  /// **'Not held'**
  String get deviceInfoNotHeld;

  /// Peer capabilities label
  ///
  /// In en, this message translates to:
  /// **'Peer capabilities'**
  String get deviceInfoPeerCapabilities;

  /// Session capabilities label
  ///
  /// In en, this message translates to:
  /// **'Session capabilities'**
  String get deviceInfoSessionCapabilities;

  /// Copy device info to clipboard button
  ///
  /// In en, this message translates to:
  /// **'Copy details'**
  String get deviceInfoCopy;

  /// Toast when copied
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get deviceInfoCopied;

  /// Foreground service prompt title
  ///
  /// In en, this message translates to:
  /// **'Keep Kabelos running?'**
  String get servicePromptTitle;

  /// Foreground service prompt description
  ///
  /// In en, this message translates to:
  /// **'Keep Kabelos running in the background so you can receive files even when the app is closed. A persistent notification will show the status.'**
  String get servicePromptDescription;

  /// Button to enable foreground service
  ///
  /// In en, this message translates to:
  /// **'Enable background service'**
  String get servicePromptEnable;

  /// Button to disable foreground service
  ///
  /// In en, this message translates to:
  /// **'Disable background service'**
  String get servicePromptDisable;

  /// Status when service is running
  ///
  /// In en, this message translates to:
  /// **'Background service is running'**
  String get servicePromptRunning;

  /// Status when service is stopped
  ///
  /// In en, this message translates to:
  /// **'Background service is stopped'**
  String get servicePromptStopped;

  /// Link to explanation
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get servicePromptLearnMore;

  /// Dismiss prompt button
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get servicePromptDismiss;

  /// Toggle to show/hide Chat tab
  ///
  /// In en, this message translates to:
  /// **'Show Chat tab'**
  String get settingsShowChat;

  /// Toggle to show/hide Audio Link tab
  ///
  /// In en, this message translates to:
  /// **'Show Audio Link tab'**
  String get settingsShowAudioLink;

  /// Toggle to show/hide Speed Test tab
  ///
  /// In en, this message translates to:
  /// **'Show Speed Test tab'**
  String get settingsShowSpeedTest;

  /// Toggle for foreground service
  ///
  /// In en, this message translates to:
  /// **'Keep Kabelos running in background'**
  String get settingsKeepServiceRunning;

  /// Background service toggle description
  ///
  /// In en, this message translates to:
  /// **'When enabled, Kabelos runs a background service to receive files even when the app is closed. Shows a persistent notification.'**
  String get settingsKeepServiceRunningDescription;

  /// Section title for tab visibility toggles
  ///
  /// In en, this message translates to:
  /// **'Visible tabs'**
  String get settingsTabsVisibility;

  /// Connection tab title (replaces Scan)
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get connectionTabTitle;

  /// Connection tab subtitle
  ///
  /// In en, this message translates to:
  /// **'Find and connect to nearby devices'**
  String get connectionTabSubtitle;

  /// Connected status with device name
  ///
  /// In en, this message translates to:
  /// **'Connected to {name}'**
  String connectionStatusConnected(String name);

  /// Ready status when Wi-Fi Direct is enabled
  ///
  /// In en, this message translates to:
  /// **'Ready — Wi-Fi Direct is on'**
  String get connectionStatusReady;

  /// Status when Wi-Fi is disabled
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi is off — Turn on Wi-Fi to continue'**
  String get connectionStatusWifiOff;

  /// Status when Wi-Fi Direct is unavailable
  ///
  /// In en, this message translates to:
  /// **'Disabled — Check settings'**
  String get connectionStatusDisabled;

  /// Setup check button in connection tab
  ///
  /// In en, this message translates to:
  /// **'Setup check'**
  String get connectionSetupCheck;

  /// QR pairing button in connection tab
  ///
  /// In en, this message translates to:
  /// **'QR pairing'**
  String get connectionQrPairing;

  /// Device info button in connection tab
  ///
  /// In en, this message translates to:
  /// **'Device info'**
  String get connectionDeviceInfo;

  /// Files tab title
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get filesTabTitle;

  /// Photos tab title
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photosTabTitle;

  /// Toast when opening Wi-Fi settings
  ///
  /// In en, this message translates to:
  /// **'Opening Wi-Fi settings...'**
  String get wifiSettingsOpened;

  /// Toast when opening nearby devices settings
  ///
  /// In en, this message translates to:
  /// **'Opening Nearby devices settings...'**
  String get nearbyDevicesSettingsOpened;

  /// Toast when opening Samsung nearby scanning settings
  ///
  /// In en, this message translates to:
  /// **'Opening Samsung Nearby scanning settings...'**
  String get samsungNearbyScanningSettingsOpened;

  /// Toast when opening app permissions
  ///
  /// In en, this message translates to:
  /// **'Opening app permissions...'**
  String get appSettingsOpened;

  /// User-friendly message for peer protocol missing
  ///
  /// In en, this message translates to:
  /// **'The other device isn\'t running Kabelos. Please make sure both devices have Kabelos installed and open.'**
  String get errorPeerProtocolMissing;

  /// Title for peer protocol missing error
  ///
  /// In en, this message translates to:
  /// **'Incompatible app'**
  String get errorPeerProtocolMissingTitle;

  /// User-friendly message for session failure
  ///
  /// In en, this message translates to:
  /// **'Connection lost. Please try connecting again.'**
  String get errorSessionFailed;

  /// Title for session failure error
  ///
  /// In en, this message translates to:
  /// **'Connection failed'**
  String get errorSessionFailedTitle;

  /// User-friendly message for Wi-Fi Direct group lost
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi Direct connection was lost. This can happen if devices move too far apart or Wi-Fi is turned off.'**
  String get errorWifiDirectGroupLost;

  /// Title for Wi-Fi Direct group lost error
  ///
  /// In en, this message translates to:
  /// **'Connection lost'**
  String get errorWifiDirectGroupLostTitle;

  /// User-friendly message for permission denied
  ///
  /// In en, this message translates to:
  /// **'Permission denied. Please enable all required permissions in Settings.'**
  String get errorPermissionDenied;

  /// Title for permission denied error
  ///
  /// In en, this message translates to:
  /// **'Permission needed'**
  String get errorPermissionDeniedTitle;

  /// User-friendly message for connection rejected
  ///
  /// In en, this message translates to:
  /// **'The other device declined the connection. Please try again.'**
  String get errorConnectionRejected;

  /// Title for connection rejected error
  ///
  /// In en, this message translates to:
  /// **'Connection declined'**
  String get errorConnectionRejectedTitle;

  /// User-friendly message for connection timeout
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Make sure both devices are close and try again.'**
  String get errorConnectionTimeout;

  /// Title for connection timeout error
  ///
  /// In en, this message translates to:
  /// **'Connection timed out'**
  String get errorConnectionTimeoutTitle;

  /// User-friendly message for Wi-Fi off
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi is turned off. Please turn on Wi-Fi to use Kabelos.'**
  String get errorWifiOff;

  /// Title for Wi-Fi off error
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi is off'**
  String get errorWifiOffTitle;

  /// Generic user-friendly error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorUnknown;

  /// Generic error title
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorUnknownTitle;

  /// User-friendly message for file transfer failure
  ///
  /// In en, this message translates to:
  /// **'File transfer failed. Please try sending again.'**
  String get errorFileTransferFailed;

  /// Title for file transfer failure
  ///
  /// In en, this message translates to:
  /// **'Transfer failed'**
  String get errorFileTransferFailedTitle;

  /// User-friendly message for audio not supported
  ///
  /// In en, this message translates to:
  /// **'Audio Link isn\'t supported on this device or connection.'**
  String get errorAudioNotSupported;

  /// Title for audio not supported error
  ///
  /// In en, this message translates to:
  /// **'Audio not available'**
  String get errorAudioNotSupportedTitle;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retryButton;

  /// Open settings button text
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettingsButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
