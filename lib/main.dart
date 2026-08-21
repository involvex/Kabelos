import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'controllers/wifi_direct_controller.dart';
import 'models/wifi_direct_models.dart';
import 'widgets/connection_tab.dart';
import 'widgets/chat_tab.dart';
import 'widgets/audio_tab.dart';
import 'widgets/speed_test_tab.dart';
import 'widgets/file_transfer_tab.dart';
import 'widgets/settings_tab.dart';
import 'screens/photo_picker_tab.dart';
import 'screens/onboarding_screen.dart';
import 'wifi_direct_service.dart';
import 'theme/theme_provider.dart';
import 'providers/language_provider.dart';
import 'services/data_manager.dart';
import 'package:kabelos/l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, LanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        return MaterialApp(
          title: 'Kabelos',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          locale: languageProvider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('de'), Locale('zh')],
          home: const KabelosHomePage(),
        );
      },
    );
  }
}

class KabelosHomePage extends StatefulWidget {
  const KabelosHomePage({super.key});

  @override
  State<KabelosHomePage> createState() => _KabelosHomePageState();
}

class _KabelosHomePageState extends State<KabelosHomePage>
    with TickerProviderStateMixin {
  late WiFiDirectController _controller;
  StreamSubscription<WiFiDirectState>? _stateSubscription;
  WiFiDirectState _state = WiFiDirectState();
  bool _onboardingComplete = false;
  bool _checkingOnboarding = true;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _checkOnboarding();
    _controller = WiFiDirectController(WiFiDirectService());
    _tabController = TabController(length: 6, vsync: this);
    _initializeController();
  }

  Future<void> _checkOnboarding() async {
    final complete =
        await DataManager.instance.getBool('onboarding_complete') ?? false;
    if (mounted) {
      setState(() {
        _onboardingComplete = complete;
        _checkingOnboarding = false;
      });
    }
  }

  Future<void> _markOnboardingComplete() async {
    await DataManager.instance.setBool('onboarding_complete', true);
    if (mounted) {
      setState(() {
        _onboardingComplete = true;
      });
      _rebuildTabs();
    }
  }

  void _initializeController() {
    _stateSubscription = _controller.stateStream.listen((newState) {
      if (!mounted) return;
      // Only trigger a parent-level rebuild when fields that affect the
      // layout (tab visibility, status pill, foreground service) change.
      // Per-tab rebuilding is handled by StateBuilder in each tab widget.
      final prev = _state;
      if (prev.settingsFieldsDiffer(newState) ||
          prev.connectionFieldsDiffer(newState)) {
        setState(() {
          _state = newState;
        });
      }
    });
  }

  void _rebuildTabs() {
    if (mounted) {
      setState(() {
        _tabController = TabController(length: _getTabCount(), vsync: this);
      });
    }
  }

  int _getTabCount() {
    // Always show Connection, Files, Settings
    // Photos, Chat, Audio Link, Speed Test based on settings
    int count = 3; // Connection, Files, Settings
    if (_state.showPhotosTab) count++;
    if (_state.showChatTab) count++;
    if (_state.showAudioTab) count++;
    if (_state.showSpeedTestTab) count++;
    return count;
  }

  List<Widget> _buildTabs() {
    final tabs = <Widget>[ConnectionTab(controller: _controller)];

    if (_state.showPhotosTab) {
      tabs.add(PhotoPickerTab(controller: _controller));
    }

    tabs.add(FileTransferTab(controller: _controller));

    if (_state.showChatTab) {
      tabs.add(ChatTab(controller: _controller));
    }

    if (_state.showSpeedTestTab) {
      tabs.add(SpeedTestTab(controller: _controller));
    }

    if (_state.showAudioTab) {
      tabs.add(AudioTab(controller: _controller));
    }

    tabs.add(
      SettingsTab(
        controller: _controller,
        onTabsVisibilityChanged: _rebuildTabs,
      ),
    );

    return tabs;
  }

  List<Tab> _buildTabButtons() {
    final l10n = AppLocalizations.of(context)!;
    final tabs = <Tab>[
      Tab(
        icon: const Icon(Icons.wifi, size: 20),
        text: l10n.connectionTabTitle,
        height: 60,
      ),
    ];

    if (_state.showPhotosTab) {
      tabs.add(
        Tab(
          icon: const Icon(Icons.photo_library, size: 20),
          text: l10n.photosTabTitle,
          height: 60,
        ),
      );
    }

    tabs.add(
      Tab(
        icon: const Icon(Icons.folder, size: 20),
        text: l10n.filesTabTitle,
        height: 60,
      ),
    );

    if (_state.showChatTab) {
      tabs.add(
        Tab(
          icon: const Icon(Icons.chat_bubble_outline, size: 20),
          text: l10n.chat,
          height: 60,
        ),
      );
    }

    if (_state.showSpeedTestTab) {
      tabs.add(
        Tab(
          icon: const Icon(Icons.speed, size: 20),
          text: l10n.speedTest,
          height: 60,
        ),
      );
    }

    if (_state.showAudioTab) {
      tabs.add(
        Tab(
          icon: const Icon(Icons.graphic_eq, size: 20),
          text: l10n.audioLink,
          height: 60,
        ),
      );
    }

    tabs.add(
      Tab(
        icon: const Icon(Icons.settings, size: 20),
        text: l10n.settings,
        height: 60,
      ),
    );

    return tabs;
  }

  @override
  void dispose() {
    _stateSubscription?.cancel();
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingOnboarding || !_onboardingComplete) {
      return OnboardingScreen(
        onComplete: _markOnboardingComplete,
        controller: _controller,
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // Status pill at top
              _buildStatusPill(context),
              // Tab bar
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).shadowColor.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.all(2),
                    labelColor: Colors.white,
                    unselectedLabelColor: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    isScrollable: _getTabCount() > 5,
                    tabs: _buildTabButtons(),
                  ),
                ),
              ),
              // Tab content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TabBarView(
                    controller: _tabController,
                    children: _buildTabs(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusPill(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (_state.isConnecting) {
      statusColor = Theme.of(context).colorScheme.primary;
      statusText = l10n.connectionStatus;
      statusIcon = Icons.sync;
    } else if (_state.connectionInfo != null &&
        _state.sessionState == 'Connected') {
      statusColor = Colors.green;
      statusText = l10n.connectionStatusConnected(
        _state.connectionInfo!.peerName ?? 'peer',
      );
      statusIcon = Icons.link;
    } else if (_state.isWifiP2pEnabled) {
      statusColor = Colors.blue;
      statusText = l10n.connectionStatusReady;
      statusIcon = Icons.wifi;
    } else {
      statusColor = Theme.of(context).colorScheme.error;
      statusText = l10n.connectionStatusWifiOff;
      statusIcon = Icons.wifi_off;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(statusIcon, size: 20, color: statusColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              statusText,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
