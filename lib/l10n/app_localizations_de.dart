// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'WiFi Direct Cable';

  @override
  String get wifiP2pDriver => 'WiFi P2P Treiber';

  @override
  String get readyForConnections => 'Bereit für Verbindungen';

  @override
  String get disabledEnableWifi => 'Deaktiviert — WLAN einschalten';

  @override
  String get connectionStatus => 'Verbindungsstatus';

  @override
  String get connected => 'Verbunden';

  @override
  String get disconnected => 'Getrennt';

  @override
  String get scanForDevices => 'Nach Geräten suchen';

  @override
  String get scanning => 'Suche...';

  @override
  String get stopScan => 'Suche stoppen';

  @override
  String get deviceInfo => 'Geräte-Info';

  @override
  String get resetWifiDirect => 'WiFi Direct zurücksetzen';

  @override
  String get noDevicesFound => 'Keine Geräte gefunden';

  @override
  String get tapScanForDevices =>
      'Tippe auf \"Nach Geräten suchen\" um Geräte in der Nähe zu finden';

  @override
  String availableDevices(int count) {
    return 'Verfügbare Geräte ($count)';
  }

  @override
  String get connect => 'Verbinden';

  @override
  String get disconnect => 'Trennen';

  @override
  String get logs => 'Protokolle';

  @override
  String get clearLogs => 'Protokolle löschen';

  @override
  String get chat => 'Chat';

  @override
  String get speedTest => 'Geschwindigkeitstest';

  @override
  String get fileTransfer => 'Dateiübertragung';

  @override
  String get settings => 'Einstellungen';

  @override
  String get connectedReadyToChat => 'Verbunden — Bereit für Chat';

  @override
  String get notConnectedConnectToPeer =>
      'Nicht verbunden — Mit einem Gerät verbinden um zu chatten';

  @override
  String get host => 'Host';

  @override
  String get client => 'Client';

  @override
  String get noMessagesYet => 'Noch keine Nachrichten';

  @override
  String get connectToPeerAndStartChatting =>
      'Mit einem Gerät verbinden und loschatten!';

  @override
  String get typeAMessage => 'Nachricht eingeben...';

  @override
  String get connectToStartChatting => 'Verbinden um zu chatten';

  @override
  String get justNow => 'Gerade eben';

  @override
  String daysAgo(int count) {
    return 'vor ${count}T';
  }

  @override
  String hoursAgo(int count) {
    return 'vor ${count}Std';
  }

  @override
  String minutesAgo(int count) {
    return 'vor ${count}Min';
  }

  @override
  String get pleaseConnectToPeerFirst =>
      'Bitte zuerst mit einem Gerät verbinden';

  @override
  String fileSent(String fileName) {
    return 'Datei gesendet: $fileName';
  }

  @override
  String failedToSendFile(String error) {
    return 'Senden fehlgeschlagen: $error';
  }

  @override
  String get notConnected => 'Nicht verbunden';

  @override
  String get readyForFileTransfer => 'Bereit für Dateiübertragung';

  @override
  String get connectToStartTransferringFiles =>
      'Verbinden um Dateien zu übertragen';

  @override
  String get sendFile => 'Datei senden';

  @override
  String get receiveFiles => 'Dateien empfangen';

  @override
  String filesWillBeAutomaticallyReceived(String location) {
    return 'Vom Partner gesendete Dateien werden in $location gespeichert';
  }

  @override
  String get saveReceivedFilesTo => 'Empfangene Dateien speichern in';

  @override
  String get appStorage => 'App-Speicher';

  @override
  String get downloadsFolder => 'Downloads';

  @override
  String get chooseCustomFolder => 'Eigenen Ordner wählen';

  @override
  String get receiveDestinationFailed =>
      'Speicherort konnte nicht verwendet werden';

  @override
  String fileReceived(String fileName) {
    return 'Datei empfangen: $fileName';
  }

  @override
  String fileTransferCancelled(String fileName) {
    return 'Übertragung abgebrochen: $fileName';
  }

  @override
  String fileTransferFailed(String fileName, String error) {
    return 'Übertragung fehlgeschlagen für $fileName: $error';
  }

  @override
  String get preparing => 'Vorbereiten';

  @override
  String get queued => 'In Warteschlange';

  @override
  String get cancelling => 'Abbrechen...';

  @override
  String get cancelled => 'Abgebrochen';

  @override
  String get failed => 'Fehlgeschlagen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get noActiveTransfers => 'Keine aktiven Übertragungen';

  @override
  String get uploadComplete => 'Hochladen abgeschlossen';

  @override
  String get downloadComplete => 'Herunterladen abgeschlossen';

  @override
  String get uploading => 'Hochladen...';

  @override
  String get downloading => 'Herunterladen...';

  @override
  String get recentTransfers => 'Letzte Übertragungen';

  @override
  String get noRecentTransfers => 'Keine letzten Übertragungen';

  @override
  String get sent => 'Gesendet';

  @override
  String get received => 'Empfangen';

  @override
  String get openFile => 'Datei öffnen';

  @override
  String get clear => 'Löschen';

  @override
  String failedToOpenFile(String error) {
    return 'Öffnen fehlgeschlagen: $error';
  }

  @override
  String noSupportedAppToOpenFile(String fileName, String location) {
    return 'Keine App zum Öffnen von $fileName gefunden. Gespeichert in $location.';
  }

  @override
  String get systemLogs => 'Systemprotokolle';

  @override
  String get noLogsYet => 'Noch keine Protokolle';

  @override
  String get customizeYourWifiDirectExperience =>
      'Passen Sie Ihre WiFi Direct Erfahrung an';

  @override
  String get appSettings => 'App-Einstellungen';

  @override
  String get language => 'Sprache';

  @override
  String get chooseYourPreferredLanguage => 'Bevorzugte Sprache wählen';

  @override
  String get followSystem => 'System folgen';

  @override
  String get english => 'Englisch';

  @override
  String get darkMode => 'Dunkler Modus';

  @override
  String get useDarkTheme => 'Dunkles Design verwenden';

  @override
  String get about => 'Über';

  @override
  String get version => 'Version';

  @override
  String get privacyPolicy => 'Datenschutz';

  @override
  String get viewOurPrivacyPolicy => 'Datenschutzrichtlinie ansehen';

  @override
  String get privacyPolicyContent =>
      'Diese App nutzt WiFi Direct für direkte Geräte-zu-Geräte-Verbindungen. Keine Daten werden an externe Server gesendet. Alle Kommunikation läuft direkt zwischen den Geräten.';

  @override
  String get ok => 'OK';

  @override
  String get speedTestStatus => 'Geschwindigkeitstest-Status';

  @override
  String get readyToTestConnectionSpeed => 'Bereit für Verbindungstest';

  @override
  String get connectToPeerToTestSpeed =>
      'Mit einem Gerät verbinden für Geschwindigkeitstest';

  @override
  String get testing => 'Test läuft...';

  @override
  String get start => 'START';

  @override
  String get tapToStartSpeedTest => 'Tippen zum Starten';

  @override
  String get connectToPeerFirst => 'Zuerst mit Gerät verbinden';

  @override
  String get downloadTest => 'Download-Test';

  @override
  String get uploadTest => 'Upload-Test';

  @override
  String get download => 'Download';

  @override
  String get upload => 'Upload';

  @override
  String speed(String speed) {
    return 'Geschwindigkeit: $speed MB/s';
  }

  @override
  String get complete => 'Abgeschlossen';

  @override
  String get inProgress => 'In Bearbeitung';

  @override
  String get latestResults => 'Letzte Ergebnisse';

  @override
  String get testCompletedAt => 'Test abgeschlossen am';

  @override
  String get noTestResultsYet => 'Noch keine Testergebnisse';

  @override
  String get runSpeedTestToSeeResults =>
      'Führen Sie einen Test durch um Ergebnisse zu sehen';

  @override
  String get testHistory => 'Testverlauf';

  @override
  String tests(int count) {
    return '$count Tests';
  }

  @override
  String get noTestHistory => 'Kein Testverlauf';

  @override
  String dayAgo(int count) {
    return 'vor $count Tag';
  }

  @override
  String daysAgoLong(int count) {
    return 'vor $count Tagen';
  }

  @override
  String hourAgo(int count) {
    return 'vor $count Stunde';
  }

  @override
  String hoursAgoLong(int count) {
    return 'vor $count Stunden';
  }

  @override
  String minuteAgo(int count) {
    return 'vor $count Minute';
  }

  @override
  String minutesAgoLong(int count) {
    return 'vor $count Minuten';
  }

  @override
  String get chinese => 'Chinesisch';

  @override
  String get githubRepositories => 'GitHub Repositories';

  @override
  String get flutterAppRepository => 'Flutter App Repository';

  @override
  String get flutterAppDescription =>
      'Kabelos - Offline Datei- & Fotosharing in der Nähe';

  @override
  String get windowsAppRepository => 'Windows App Repository';

  @override
  String get windowsAppDescription => 'WDCableWUI - Windows Begleit-App';

  @override
  String urlCopiedToClipboard(String url) {
    return 'URL in Zwischenablage kopiert: $url';
  }

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsSubtitle => 'Passen Sie Ihre WiFi Direct Erfahrung an';

  @override
  String get audioLink => 'Audio Link';

  @override
  String get audioConnectToPeerFirst => 'Zuerst mit Gerät verbinden';

  @override
  String get audioPeerUnsupported =>
      'Das verbundene Gerät unterstützt Audio Link nicht';

  @override
  String get audioReady => 'Audio Link ist bereit';

  @override
  String get audioMode => 'Modus';

  @override
  String get audioReceive => 'Empfangen';

  @override
  String get audioSend => 'Senden';

  @override
  String get audioSource => 'Quelle';

  @override
  String get audioMicrophone => 'Mikrofon';

  @override
  String get audioDeviceAudioUnavailable => 'Geräte-Audio nicht verfügbar';

  @override
  String get audioLatencyMode => 'Latenz-Modus';

  @override
  String get audioLowLatency => 'Niedrige Latenz';

  @override
  String get audioStable => 'Stabil';

  @override
  String get audioQualityMode => 'Qualität';

  @override
  String get audioQualityStandard => 'Standard';

  @override
  String get audioQualityBalanced => 'Ausgewogen';

  @override
  String get audioQualityHigh => 'Hoch';

  @override
  String get audioQualityNearLossless => 'Fast verlustfrei';

  @override
  String get audioEncoding => 'Kodierung';

  @override
  String get audioOpus => 'Opus';

  @override
  String get audioOpus32Kbps => 'Opus 32 kbps';

  @override
  String get audioOnlyOption => 'Einzige Option';

  @override
  String get audioFollowSenderSide => 'Sender-Seite folgen';

  @override
  String get audioStop => 'Audio stoppen';

  @override
  String get audioStart => 'Audio starten';

  @override
  String get audioLiveStats => 'Live Stats';

  @override
  String get audioState => 'Status';

  @override
  String get audioBitrate => 'Bitrate';

  @override
  String get audioConfiguredBitrate => 'Konfiguriert';

  @override
  String get audioQuality => 'Qualität';

  @override
  String get audioBuffer => 'Puffer';

  @override
  String get audioDropped => 'Verworfen';

  @override
  String get audioPacketLoss => 'Paketverlust';

  @override
  String get audioLateDrops => 'Späte Verluste';

  @override
  String get audioOverflowDrops => 'Überlauf-Verluste';

  @override
  String get audioPlc => 'PLC';

  @override
  String get audioRtcpLoss => 'RTCP Verlust';

  @override
  String get audioRtcpJitter => 'RTCP Jitter';

  @override
  String get audioRoundTrip => 'Rundlaufzeit';

  @override
  String get audioFrames => 'Frames';

  @override
  String get audioLatency => 'Latenz';

  @override
  String get audioStateReceiveReady => 'Empfangsbereit';

  @override
  String get audioStateOfferSent => 'Angebot gesendet';

  @override
  String get audioStateConnecting => 'Verbinde...';

  @override
  String get audioStateStreaming => 'Streaming';

  @override
  String get audioStateIdle => 'Inaktiv';

  @override
  String get notAvailableShort => 'N/A';

  @override
  String get kbpsUnit => 'kbps';

  @override
  String get appTitleNew => 'Kabelos';

  @override
  String get appTagline =>
      'Dateien zwischen nahe Geräten teilen — ganz ohne Internet';

  @override
  String get onboardingTitle => 'Willkommen bei Kabelos';

  @override
  String get onboardingSubtitle =>
      'Teilen Sie Fotos, Dateien und mehr mit Geräten in der Nähe — über Wi-Fi Direct';

  @override
  String get onboardingStep1Title => 'WLAN einschalten';

  @override
  String get onboardingStep1Description =>
      'Kabelos nutzt Wi-Fi Direct für direkte Verbindungen zu Geräten in der Nähe. Kein Internet, Router oder Hotspot nötig.';

  @override
  String get onboardingStep2Title => 'Zugriff auf nahe Geräte erlauben';

  @override
  String get onboardingStep2Description =>
      'Android 13+ benötigt die Berechtigung, um nahe Geräte zu finden und zu verbinden. Ihr Standort wird nicht verwendet.';

  @override
  String get onboardingStep3Title => 'Kabelos im Hintergrund laufen lassen';

  @override
  String get onboardingStep3Description =>
      'Aktivieren Sie den Hintergrunddienst, damit Kabelos Dateien empfängt, auch wenn die App geschlossen ist. In den Einstellungen änderbar.';

  @override
  String get onboardingStep4Title => 'Hinweis für Samsung One UI';

  @override
  String get onboardingStep4Description =>
      'Auf Samsung Tablets und Handys: Einstellungen → Verbindungen → Weitere Verbindungseinstellungen → Nearby-Geräte scannen → EIN. Auch prüfen: Einstellungen → Apps → Kabelos → Berechtigungen → Nahe Geräte = Erlauben.';

  @override
  String get onboardingContinue => 'Weiter';

  @override
  String get onboardingFinish => 'Einrichtung abschließen';

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingChecking => 'Prüfe Einrichtung...';

  @override
  String get onboardingCheckPassed => 'Einrichtung sieht gut aus!';

  @override
  String get onboardingCheckFailed => 'Einige Punkte brauchen Aufmerksamkeit';

  @override
  String get setupCheckTitle => 'Einrichtungsprüfung';

  @override
  String get setupCheckSubtitle =>
      'Prüfen ob Kabelos bereit zum Senden und Empfangen ist';

  @override
  String get setupCheckRunning => 'Prüfe...';

  @override
  String get setupCheckItemWifiOn => 'WLAN ist eingeschaltet';

  @override
  String get setupCheckItemWifiDirectReady => 'Wi-Fi Direct ist bereit';

  @override
  String get setupCheckItemNearbyPermission =>
      'Berechtigung für nahe Geräte erteilt';

  @override
  String get setupCheckItemForegroundService => 'Hintergrunddienst läuft';

  @override
  String get setupCheckItemWifiLock => 'WLAN-Sperre aktiv';

  @override
  String get setupCheckItemWakeLock => 'Wake-Sperre aktiv';

  @override
  String get setupCheckItemSamsungNearbyScanning =>
      'Samsung Nearby-Geräte-Scan ist AN';

  @override
  String get setupCheckPass => 'OK';

  @override
  String get setupCheckFail => 'Braucht Aufmerksamkeit';

  @override
  String get setupCheckFixIt => 'Beheben';

  @override
  String get setupCheckAllGood =>
      'Alle Prüfungen bestanden — Kabelos ist bereit!';

  @override
  String get setupCheckSomeFailed =>
      'Einige Prüfungen fehlgeschlagen. Tippen Sie auf \"Beheben\".';

  @override
  String get qrPairingTitle => 'QR-Pairing-Hilfe';

  @override
  String get qrPairingSubtitle =>
      'Code anzeigen oder scannen um das andere Gerät zu identifizieren';

  @override
  String get qrPairingShowCode => 'Meinen Code anzeigen';

  @override
  String get qrPairingScanCode => 'Anderes Gerät scannen';

  @override
  String get qrPairingYourCode => 'Ihr Kabelos-Code';

  @override
  String get qrPairingDeviceName => 'Gerätename';

  @override
  String get qrPairingPairingCode => 'Pairing-Code';

  @override
  String get qrPairingNote =>
      'Dieser Code hilft Ihnen, das richtige Gerät zu finden. Sie müssen trotzdem in der Geräteliste auf \"Verbinden\" tippen. Wi-Fi Direct erlaubt kein automatisches Pairing per Code allein.';

  @override
  String get qrPairingScanning =>
      'Kamera auf den QR-Code des anderen Geräts richten';

  @override
  String qrPairingScanResult(String name, String code) {
    return 'Gefunden: $name ($code)';
  }

  @override
  String get qrPairingPermissionCamera =>
      'Kamera-Berechtigung nötig zum Scannen von QR-Codes';

  @override
  String get photoPickerTitle => 'Fotos senden';

  @override
  String get photoPickerSubtitle =>
      'Wählen Sie Fotos aus Ihrer Bibliothek zum Senden';

  @override
  String get photoPickerSelectPhotos => 'Fotos auswählen';

  @override
  String get photoPickerNoPhotosSelected => 'Keine Fotos ausgewählt';

  @override
  String photoPickerSelectedCount(int count) {
    return '$count Foto(s) ausgewählt';
  }

  @override
  String photoPickerSend(int count) {
    return '$count Foto(s) senden';
  }

  @override
  String get photoPickerPermissionPhotos =>
      'Fotos-Berechtigung nötig für Zugriff auf Ihre Bibliothek';

  @override
  String get deviceInfoTitle => 'Geräteinformationen';

  @override
  String get deviceInfoSubtitle =>
      'Details zu diesem Gerät und der Wi-Fi Direct Verbindung';

  @override
  String get deviceInfoThisDevice => 'Dieses Gerät';

  @override
  String get deviceInfoConnectedPeer => 'Verbundenes Gerät';

  @override
  String get deviceInfoDeviceName => 'Gerätename';

  @override
  String get deviceInfoModel => 'Modell';

  @override
  String get deviceInfoAndroidVersion => 'Android-Version';

  @override
  String get deviceInfoAppVersion => 'App-Version';

  @override
  String get deviceInfoWifiDirectStatus => 'Wi-Fi Direct Status';

  @override
  String get deviceInfoIsGroupOwner => 'Gruppenbesitzer';

  @override
  String get deviceInfoGroupOwner => 'Gruppenbesitzer';

  @override
  String get deviceInfoClient => 'Client';

  @override
  String get deviceInfoNetworkAddress => 'Netzadresse';

  @override
  String get deviceInfoPassphrase => 'Passphrase';

  @override
  String get deviceInfoFrequency => 'Frequenz';

  @override
  String get deviceInfoWifiState => 'WLAN-Status';

  @override
  String get deviceInfoForegroundService => 'Hintergrunddienst';

  @override
  String get deviceInfoWifiLock => 'WLAN-Sperre';

  @override
  String get deviceInfoWakeLock => 'Wake-Sperre';

  @override
  String get deviceInfoRunning => 'Läuft';

  @override
  String get deviceInfoStopped => 'Gestoppt';

  @override
  String get deviceInfoHeld => 'Aktiv';

  @override
  String get deviceInfoNotHeld => 'Inaktiv';

  @override
  String get deviceInfoPeerCapabilities => 'Partner-Fähigkeiten';

  @override
  String get deviceInfoSessionCapabilities => 'Sitzungs-Fähigkeiten';

  @override
  String get deviceInfoCopy => 'Details kopieren';

  @override
  String get deviceInfoCopied => 'In Zwischenablage kopiert';

  @override
  String get servicePromptTitle => 'Kabelos im Hintergrund laufen lassen?';

  @override
  String get servicePromptDescription =>
      'Kabelos im Hintergrund aktivieren, damit Sie Dateien empfangen, auch wenn die App geschlossen ist. Eine permanente Benachrichtigung zeigt den Status.';

  @override
  String get servicePromptEnable => 'Hintergrunddienst aktivieren';

  @override
  String get servicePromptDisable => 'Hintergrunddienst deaktivieren';

  @override
  String get servicePromptRunning => 'Hintergrunddienst läuft';

  @override
  String get servicePromptStopped => 'Hintergrunddienst gestoppt';

  @override
  String get servicePromptLearnMore => 'Mehr erfahren';

  @override
  String get servicePromptDismiss => 'Später';

  @override
  String get settingsShowChat => 'Chat-Reiter anzeigen';

  @override
  String get settingsShowAudioLink => 'Audio Link-Reiter anzeigen';

  @override
  String get settingsShowSpeedTest => 'Geschwindigkeitstest-Reiter anzeigen';

  @override
  String get settingsKeepServiceRunning =>
      'Kabelos im Hintergrund laufen lassen';

  @override
  String get settingsKeepServiceRunningDescription =>
      'Wenn aktiviert, läuft Kabelos als Hintergrunddienst um Dateien zu empfangen, auch wenn die App geschlossen ist. Zeigt eine permanente Benachrichtigung.';

  @override
  String get settingsTabsVisibility => 'Sichtbare Reiter';

  @override
  String get connectionTabTitle => 'Geräte';

  @override
  String get connectionTabSubtitle => 'Nahe Geräte finden und verbinden';

  @override
  String connectionStatusConnected(String name) {
    return 'Verbunden mit $name';
  }

  @override
  String get connectionStatusReady => 'Bereit — Wi-Fi Direct ist an';

  @override
  String get connectionStatusWifiOff => 'WLAN ist aus — WLAN einschalten';

  @override
  String get connectionStatusDisabled => 'Deaktiviert — Einstellungen prüfen';

  @override
  String get connectionSetupCheck => 'Einrichtungsprüfung';

  @override
  String get connectionQrPairing => 'QR-Pairing';

  @override
  String get connectionDeviceInfo => 'Geräte-Info';

  @override
  String get filesTabTitle => 'Dateien';

  @override
  String get photosTabTitle => 'Fotos';

  @override
  String get wifiSettingsOpened => 'Öffne WLAN-Einstellungen...';

  @override
  String get nearbyDevicesSettingsOpened =>
      'Öffne Einstellungen für nahe Geräte...';

  @override
  String get samsungNearbyScanningSettingsOpened =>
      'Öffne Samsung Nearby-Scan-Einstellungen...';

  @override
  String get appSettingsOpened => 'Öffne App-Berechtigungen...';
}
