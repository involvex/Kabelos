// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'WiFi直连线缆';

  @override
  String get wifiP2pDriver => 'WiFi P2P驱动';

  @override
  String get readyForConnections => '准备连接';

  @override
  String get disabledEnableWifi => '已禁用 - 启用WiFi以继续';

  @override
  String get connectionStatus => '连接状态';

  @override
  String get connected => '已连接';

  @override
  String get disconnected => '未连接';

  @override
  String get scanForDevices => '扫描设备';

  @override
  String get scanning => '扫描中...';

  @override
  String get stopScan => '停止扫描';

  @override
  String get deviceInfo => '设备信息';

  @override
  String get resetWifiDirect => '重置WiFi直连';

  @override
  String get noDevicesFound => '未找到设备';

  @override
  String get tapScanForDevices => '点击\"扫描设备\"查找附近设备';

  @override
  String availableDevices(int count) {
    return '可用设备 ($count)';
  }

  @override
  String get connect => '连接';

  @override
  String get disconnect => '断开连接';

  @override
  String get logs => '日志';

  @override
  String get clearLogs => '清除日志';

  @override
  String get chat => '聊天';

  @override
  String get speedTest => '速度测试';

  @override
  String get fileTransfer => '文件传输';

  @override
  String get settings => '设置';

  @override
  String get connectedReadyToChat => '已连接 - 准备聊天';

  @override
  String get notConnectedConnectToPeer => '未连接 - 连接到对等设备开始聊天';

  @override
  String get host => '主机';

  @override
  String get client => '客户端';

  @override
  String get noMessagesYet => '暂无消息';

  @override
  String get connectToPeerAndStartChatting => '连接到对等设备开始聊天！';

  @override
  String get typeAMessage => '输入消息...';

  @override
  String get connectToStartChatting => '连接后开始聊天';

  @override
  String get justNow => '刚刚';

  @override
  String daysAgo(int count) {
    return '$count天前';
  }

  @override
  String hoursAgo(int count) {
    return '$count小时前';
  }

  @override
  String minutesAgo(int count) {
    return '$count分钟前';
  }

  @override
  String get pleaseConnectToPeerFirst => '请先连接到对等设备';

  @override
  String fileSent(String fileName) {
    return '文件已发送：$fileName';
  }

  @override
  String failedToSendFile(String error) {
    return '发送文件失败：$error';
  }

  @override
  String get notConnected => '未连接';

  @override
  String get readyForFileTransfer => '准备文件传输';

  @override
  String get connectToStartTransferringFiles => '连接后开始传输文件';

  @override
  String get sendFile => '发送文件';

  @override
  String get receiveFiles => '接收文件';

  @override
  String filesWillBeAutomaticallyReceived(String location) {
    return '对等设备发送的文件将保存到 $location';
  }

  @override
  String get saveReceivedFilesTo => '接收文件保存到';

  @override
  String get appStorage => '应用存储';

  @override
  String get downloadsFolder => '下载文件夹';

  @override
  String get chooseCustomFolder => '选择自定义文件夹';

  @override
  String get receiveDestinationFailed => '无法使用该接收位置';

  @override
  String fileReceived(String fileName) {
    return '已接收文件：$fileName';
  }

  @override
  String fileTransferCancelled(String fileName) {
    return '传输已取消：$fileName';
  }

  @override
  String fileTransferFailed(String fileName, String error) {
    return '文件 $fileName 传输失败：$error';
  }

  @override
  String get preparing => '准备中';

  @override
  String get queued => '排队中';

  @override
  String get cancelling => '正在取消...';

  @override
  String get cancelled => '已取消';

  @override
  String get failed => '失败';

  @override
  String get cancel => '取消';

  @override
  String get noActiveTransfers => '无活动传输';

  @override
  String get uploadComplete => '上传完成';

  @override
  String get downloadComplete => '下载完成';

  @override
  String get uploading => '上传中...';

  @override
  String get downloading => '下载中...';

  @override
  String get recentTransfers => '最近传输';

  @override
  String get noRecentTransfers => '无最近传输';

  @override
  String get sent => '已发送';

  @override
  String get received => '已接收';

  @override
  String get openFile => '打开文件';

  @override
  String get clear => '清除';

  @override
  String failedToOpenFile(String error) {
    return '打开文件失败：$error';
  }

  @override
  String noSupportedAppToOpenFile(String fileName, String location) {
    return '没有支持打开 $fileName 的应用。文件已保存在 $location。';
  }

  @override
  String get systemLogs => '系统日志';

  @override
  String get noLogsYet => '暂无日志';

  @override
  String get customizeYourWifiDirectExperience => '自定义您的WiFi直连体验';

  @override
  String get appSettings => '应用设置';

  @override
  String get language => '语言';

  @override
  String get chooseYourPreferredLanguage => '选择您的首选语言';

  @override
  String get followSystem => '跟随系统';

  @override
  String get english => 'English';

  @override
  String get darkMode => '深色模式';

  @override
  String get useDarkTheme => '使用深色主题';

  @override
  String get about => '关于';

  @override
  String get version => '版本';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get viewOurPrivacyPolicy => '查看我们的隐私政策';

  @override
  String get privacyPolicyContent =>
      '此应用使用WiFi直连建立点对点连接。不会向外部服务器发送数据。所有通信都直接在设备之间进行。';

  @override
  String get ok => '确定';

  @override
  String get speedTestStatus => '速度测试状态';

  @override
  String get readyToTestConnectionSpeed => '准备测试连接速度';

  @override
  String get connectToPeerToTestSpeed => '连接到对等设备以测试速度';

  @override
  String get testing => '测试中...';

  @override
  String get start => '开始';

  @override
  String get tapToStartSpeedTest => '点击开始速度测试';

  @override
  String get connectToPeerFirst => '请先连接到对等设备';

  @override
  String get downloadTest => '下载测试';

  @override
  String get uploadTest => '上传测试';

  @override
  String get download => '下载';

  @override
  String get upload => '上传';

  @override
  String speed(String speed) {
    return '速度：$speed MB/s';
  }

  @override
  String get complete => '完成';

  @override
  String get inProgress => '进行中';

  @override
  String get latestResults => '最新结果';

  @override
  String get testCompletedAt => '测试完成时间';

  @override
  String get noTestResultsYet => '暂无测试结果';

  @override
  String get runSpeedTestToSeeResults => '运行速度测试以查看结果';

  @override
  String get testHistory => '测试历史';

  @override
  String tests(int count) {
    return '$count次测试';
  }

  @override
  String get noTestHistory => '无测试历史';

  @override
  String dayAgo(int count) {
    return '$count天前';
  }

  @override
  String daysAgoLong(int count) {
    return '$count天前';
  }

  @override
  String hourAgo(int count) {
    return '$count小时前';
  }

  @override
  String hoursAgoLong(int count) {
    return '$count小时前';
  }

  @override
  String minuteAgo(int count) {
    return '$count分钟前';
  }

  @override
  String minutesAgoLong(int count) {
    return '$count分钟前';
  }

  @override
  String get chinese => '中文';

  @override
  String get githubRepositories => 'GitHub 仓库';

  @override
  String get flutterAppRepository => 'Flutter 应用仓库';

  @override
  String get flutterAppDescription => 'Kabelos - 离线附近文件与照片分享';

  @override
  String get windowsAppRepository => 'Windows 应用仓库';

  @override
  String get windowsAppDescription => 'WDCableWUI - Windows 配套应用程序';

  @override
  String urlCopiedToClipboard(String url) {
    return 'URL 已复制到剪贴板：$url';
  }

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsSubtitle => '自定义您的WiFi直连体验';

  @override
  String get audioLink => '音频链接';

  @override
  String get audioConnectToPeerFirst => '请先连接到对等设备';

  @override
  String get audioPeerUnsupported => '已连接的对等设备不支持音频链接';

  @override
  String get audioReady => '音频链接已就绪';

  @override
  String get audioMode => '模式';

  @override
  String get audioReceive => '接收';

  @override
  String get audioSend => '发送';

  @override
  String get audioSource => '来源';

  @override
  String get audioMicrophone => '麦克风';

  @override
  String get audioDeviceAudioUnavailable => '设备音频暂不可用';

  @override
  String get audioLatencyMode => '延迟模式';

  @override
  String get audioLowLatency => '低延迟';

  @override
  String get audioStable => '稳定';

  @override
  String get audioQualityMode => '质量';

  @override
  String get audioQualityStandard => '标准';

  @override
  String get audioQualityBalanced => '平衡';

  @override
  String get audioQualityHigh => '高';

  @override
  String get audioQualityNearLossless => '近无损';

  @override
  String get audioEncoding => '编码';

  @override
  String get audioOpus => 'Opus';

  @override
  String get audioOpus32Kbps => 'Opus 32 kbps';

  @override
  String get audioOnlyOption => '唯一选项';

  @override
  String get audioFollowSenderSide => '跟随发送端';

  @override
  String get audioStop => '停止音频';

  @override
  String get audioStart => '开始音频';

  @override
  String get audioLiveStats => '实时统计';

  @override
  String get audioState => '状态';

  @override
  String get audioBitrate => '比特率';

  @override
  String get audioConfiguredBitrate => '配置';

  @override
  String get audioQuality => '质量';

  @override
  String get audioBuffer => '缓冲';

  @override
  String get audioDropped => '丢帧';

  @override
  String get audioPacketLoss => '丢包';

  @override
  String get audioLateDrops => '迟到丢包';

  @override
  String get audioOverflowDrops => '溢出丢包';

  @override
  String get audioPlc => '丢包补偿';

  @override
  String get audioRtcpLoss => 'RTCP 丢包';

  @override
  String get audioRtcpJitter => 'RTCP 抖动';

  @override
  String get audioRoundTrip => '往返';

  @override
  String get audioFrames => '帧';

  @override
  String get audioLatency => '延迟';

  @override
  String get audioStateReceiveReady => '接收就绪';

  @override
  String get audioStateOfferSent => '已发送请求';

  @override
  String get audioStateConnecting => '连接中';

  @override
  String get audioStateStreaming => '传输中';

  @override
  String get audioStateIdle => '空闲';

  @override
  String get notAvailableShort => 'N/A';

  @override
  String get kbpsUnit => 'kbps';

  @override
  String get appTitleNew => 'Kabelos';

  @override
  String get appTagline => '在近距离设备间分享文件 — 无需互联网';

  @override
  String get onboardingTitle => '欢迎使用 Kabelos';

  @override
  String get onboardingSubtitle => '通过 Wi-Fi Direct 与附近设备分享照片、文件等';

  @override
  String get onboardingStep1Title => '打开 Wi-Fi';

  @override
  String get onboardingStep1Description =>
      'Kabelos 使用 Wi-Fi Direct 直接连接附近设备。无需互联网、路由器或热点。';

  @override
  String get onboardingStep2Title => '允许访问附近设备';

  @override
  String get onboardingStep2Description =>
      'Android 13+ 需要权限来查找和连接附近设备。这不会使用您的位置信息。';

  @override
  String get onboardingStep3Title => '让 Kabelos 在后台运行';

  @override
  String get onboardingStep3Description =>
      '启用后台服务，即使应用关闭，Kabelos 也能随时接收文件。稍后可在设置中更改。';

  @override
  String get onboardingStep4Title => '三星 One UI 提示';

  @override
  String get onboardingStep4Description =>
      '三星平板和手机：设置 → 连接 → 更多连接设置 → 附近设备扫描 → 开启。同时检查：设置 → 应用 → Kabelos → 权限 → 附近设备 = 允许。';

  @override
  String get onboardingContinue => '继续';

  @override
  String get onboardingFinish => '完成设置';

  @override
  String get onboardingSkip => '跳过';

  @override
  String get onboardingChecking => '检查设置...';

  @override
  String get onboardingCheckPassed => '设置看起来不错！';

  @override
  String get onboardingCheckFailed => '某些项目需要注意';

  @override
  String get setupCheckTitle => '设置检查';

  @override
  String get setupCheckSubtitle => '验证 Kabelos 是否准备好发送和接收';

  @override
  String get setupCheckRunning => '检查中...';

  @override
  String get setupCheckItemWifiOn => 'Wi-Fi 已开启';

  @override
  String get setupCheckItemWifiDirectReady => 'Wi-Fi Direct 就绪';

  @override
  String get setupCheckItemNearbyPermission => '附近设备权限已授予';

  @override
  String get setupCheckItemForegroundService => '后台服务正在运行';

  @override
  String get setupCheckItemWifiLock => 'Wi-Fi 锁已持有';

  @override
  String get setupCheckItemWakeLock => '唤醒锁已持有';

  @override
  String get setupCheckItemSamsungNearbyScanning => '三星附近设备扫描已开启';

  @override
  String get setupCheckPass => '通过';

  @override
  String get setupCheckFail => '需注意';

  @override
  String get setupCheckFixIt => '修复';

  @override
  String get setupCheckAllGood => '所有检查通过 — Kabelos 已就绪！';

  @override
  String get setupCheckSomeFailed => '部分检查失败。点击 \"修复\" 解决。';

  @override
  String get qrPairingTitle => 'QR 配对助手';

  @override
  String get qrPairingSubtitle => '显示或扫描代码以识别另一设备';

  @override
  String get qrPairingShowCode => '显示我的代码';

  @override
  String get qrPairingScanCode => '扫描另一设备';

  @override
  String get qrPairingYourCode => '您的 Kabelos 代码';

  @override
  String get qrPairingDeviceName => '设备名称';

  @override
  String get qrPairingPairingCode => '配对代码';

  @override
  String get qrPairingNote =>
      '此代码帮助您识别正确设备。仍需在设备列表点击 \"连接\"。Wi-Fi Direct 不支持仅凭代码自动配对。';

  @override
  String get qrPairingScanning => '将相机对准另一设备的 QR 码';

  @override
  String qrPairingScanResult(String name, String code) {
    return '发现：$name ($code)';
  }

  @override
  String get qrPairingPermissionCamera => '需要相机权限扫描 QR 码';

  @override
  String get photoPickerTitle => '发送照片';

  @override
  String get photoPickerSubtitle => '从相册选择照片发送';

  @override
  String get photoPickerSelectPhotos => '选择照片';

  @override
  String get photoPickerNoPhotosSelected => '未选择照片';

  @override
  String photoPickerSelectedCount(int count) {
    return '已选择 $count 张照片';
  }

  @override
  String photoPickerSend(int count) {
    return '发送 $count 张照片';
  }

  @override
  String get photoPickerPermissionPhotos => '需要照片权限访问您的相册';

  @override
  String get deviceInfoTitle => '设备信息';

  @override
  String get deviceInfoSubtitle => '关于此设备和 Wi-Fi Direct 连接的详情';

  @override
  String get deviceInfoThisDevice => '此设备';

  @override
  String get deviceInfoConnectedPeer => '已连接设备';

  @override
  String get deviceInfoDeviceName => '设备名称';

  @override
  String get deviceInfoModel => '型号';

  @override
  String get deviceInfoAndroidVersion => 'Android 版本';

  @override
  String get deviceInfoAppVersion => '应用版本';

  @override
  String get deviceInfoWifiDirectStatus => 'Wi-Fi Direct 状态';

  @override
  String get deviceInfoIsGroupOwner => '群组所有者';

  @override
  String get deviceInfoGroupOwner => '群组所有者';

  @override
  String get deviceInfoClient => '客户端';

  @override
  String get deviceInfoNetworkAddress => '网络地址';

  @override
  String get deviceInfoPassphrase => '密码';

  @override
  String get deviceInfoFrequency => '频率';

  @override
  String get deviceInfoWifiState => 'Wi-Fi 状态';

  @override
  String get deviceInfoForegroundService => '后台服务';

  @override
  String get deviceInfoWifiLock => 'Wi-Fi 锁';

  @override
  String get deviceInfoWakeLock => '唤醒锁';

  @override
  String get deviceInfoRunning => '运行中';

  @override
  String get deviceInfoStopped => '已停止';

  @override
  String get deviceInfoHeld => '已持有';

  @override
  String get deviceInfoNotHeld => '未持有';

  @override
  String get deviceInfoPeerCapabilities => '对端能力';

  @override
  String get deviceInfoSessionCapabilities => '会话能力';

  @override
  String get deviceInfoCopy => '复制详情';

  @override
  String get deviceInfoCopied => '已复制到剪贴板';

  @override
  String get servicePromptTitle => '让 Kabelos 在后台运行？';

  @override
  String get servicePromptDescription => '启用后台服务，即使应用关闭也能接收文件。会显示持久通知指示状态。';

  @override
  String get servicePromptEnable => '启用后台服务';

  @override
  String get servicePromptDisable => '禁用后台服务';

  @override
  String get servicePromptRunning => '后台服务运行中';

  @override
  String get servicePromptStopped => '后台服务已停止';

  @override
  String get servicePromptLearnMore => '了解更多';

  @override
  String get servicePromptDismiss => '稍后';

  @override
  String get settingsShowChat => '显示聊天标签页';

  @override
  String get settingsShowAudioLink => '显示音频链路标签页';

  @override
  String get settingsShowSpeedTest => '显示速度测试标签页';

  @override
  String get settingsKeepServiceRunning => '让 Kabelos 在后台运行';

  @override
  String get settingsKeepServiceRunningDescription =>
      '启用后，Kabelos 作为后台服务运行，应用关闭时也能接收文件。会显示持久通知。';

  @override
  String get settingsTabsVisibility => '可见标签页';

  @override
  String get connectionTabTitle => '设备';

  @override
  String get connectionTabSubtitle => '查找并连接附近设备';

  @override
  String connectionStatusConnected(String name) {
    return '已连接至 $name';
  }

  @override
  String get connectionStatusReady => '就绪 — Wi-Fi Direct 已开启';

  @override
  String get connectionStatusWifiOff => 'Wi-Fi 关闭 — 请开启 Wi-Fi';

  @override
  String get connectionStatusDisabled => '已禁用 — 请检查设置';

  @override
  String get connectionSetupCheck => '设置检查';

  @override
  String get connectionQrPairing => 'QR 配对';

  @override
  String get connectionDeviceInfo => '设备信息';

  @override
  String get filesTabTitle => '文件';

  @override
  String get photosTabTitle => '照片';

  @override
  String get wifiSettingsOpened => '正在打开 Wi-Fi 设置...';

  @override
  String get nearbyDevicesSettingsOpened => '正在打开附近设备设置...';

  @override
  String get samsungNearbyScanningSettingsOpened => '正在打开三星附近扫描设置...';

  @override
  String get appSettingsOpened => '正在打开应用权限...';
}
