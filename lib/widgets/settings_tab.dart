import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../controllers/wifi_direct_controller.dart';
import '../models/wifi_direct_models.dart';
import '../theme/theme_provider.dart';
import '../providers/language_provider.dart';
import 'state_builder.dart';

class SettingsTab extends StatefulWidget {
  final WiFiDirectController controller;
  final VoidCallback onTabsVisibilityChanged;

  const SettingsTab({
    super.key,
    required this.controller,
    required this.onTabsVisibilityChanged,
  });

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      controller: widget.controller,
      shouldRebuild: (prev, curr) => curr.settingsFieldsDiffer(prev),
      builder: (context, s) => _buildContent(context, s),
    );
  }

  Widget _buildContent(BuildContext context, WiFiDirectState s) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.settingsTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.settingsSubtitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(l10n.appSettings, Icons.app_settings_alt, [
            _buildLanguageSetting(),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return _buildSwitchSetting(
                  l10n.darkMode,
                  l10n.useDarkTheme,
                  Icons.dark_mode,
                  themeProvider.isDarkMode,
                  (value) {
                    if (value ?? false) {
                      themeProvider.setThemeMode(ThemeMode.dark);
                    } else {
                      themeProvider.setThemeMode(ThemeMode.light);
                    }
                  },
                );
              },
            ),
          ]),
          const SizedBox(height: 20),
          _buildSection("Kabelos", Icons.favorite, [
            _buildSwitchSetting(
              l10n.settingsKeepServiceRunning,
              l10n.settingsKeepServiceRunningDescription,
              Icons.play_arrow,
              s.isForegroundServiceRunning,
              (value) async {
                await widget.controller.setKeepServiceRunning(value ?? false);
                widget.onTabsVisibilityChanged();
              },
            ),
          ]),
          const SizedBox(height: 20),
          _buildSection(l10n.settingsTabsVisibility, Icons.view_quilt, [
            _buildTabToggle(
              l10n.photosTabTitle,
              Icons.photo_library,
              s.showPhotosTab,
              (v) async {
                await widget.controller.updateTabVisibility(showPhotosTab: v);
                widget.onTabsVisibilityChanged();
              },
            ),
            _buildTabToggle(
              l10n.chat,
              Icons.chat_bubble_outline,
              s.showChatTab,
              (v) async {
                await widget.controller.updateTabVisibility(showChatTab: v);
                widget.onTabsVisibilityChanged();
              },
            ),
            _buildTabToggle(l10n.audioLink, Icons.graphic_eq, s.showAudioTab, (
              v,
            ) async {
              await widget.controller.updateTabVisibility(showAudioTab: v);
              widget.onTabsVisibilityChanged();
            }),
            _buildTabToggle(l10n.speedTest, Icons.speed, s.showSpeedTestTab, (
              v,
            ) async {
              await widget.controller.updateTabVisibility(showSpeedTestTab: v);
              widget.onTabsVisibilityChanged();
            }),
          ]),
          const SizedBox(height: 20),
          _buildSection(l10n.githubRepositories, Icons.code, [
            _buildActionTile(
              l10n.flutterAppRepository,
              l10n.flutterAppDescription,
              Icons.phone_android,
              () => _copyToClipboard(
                'https://github.com/jingcjie/WDCable_flutter',
              ),
            ),
            _buildActionTile(
              l10n.windowsAppRepository,
              l10n.windowsAppDescription,
              Icons.desktop_windows,
              () => _copyToClipboard('https://github.com/jingcjie/WDCableWUI'),
            ),
          ]),
          const SizedBox(height: 20),
          _buildSection(l10n.about, Icons.info, [
            _buildInfoTile(
              l10n.version,
              s.appVersion.isEmpty ? 'Unknown' : s.appVersion,
              Icons.info_outline,
            ),
            _buildActionTile(
              l10n.privacyPolicy,
              l10n.viewOurPrivacyPolicy,
              Icons.privacy_tip,
              () => _showPrivacyPolicy(),
            ),
          ]),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildLanguageSetting() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.language, color: Colors.grey[600], size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalizations.of(context)!.chooseYourPreferredLanguage,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Consumer<LanguageProvider>(
              builder: (context, languageProvider, child) {
                return DropdownButton<String>(
                  value: languageProvider.currentLanguage,
                  items: [
                    DropdownMenuItem(
                      value: 'system',
                      child: Text(AppLocalizations.of(context)!.followSystem),
                    ),
                    const DropdownMenuItem(value: 'en', child: Text('English')),
                    const DropdownMenuItem(value: 'de', child: Text('Deutsch')),
                    const DropdownMenuItem(value: 'zh', child: Text('中文')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      languageProvider.setLanguage(value);
                    }
                  },
                  underline: const SizedBox.shrink(),
                  isExpanded: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchSetting(
    String title,
    String description,
    IconData icon,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildTabToggle(
    String title,
    IconData icon,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[600]),
        title: Text(title),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[600]),
        title: Text(title),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        onTap: () {},
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.urlCopiedToClipboard(text)),
      ),
    );
  }

  void _showPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.privacyPolicy),
        content: Text(AppLocalizations.of(context)!.privacyPolicyContent),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }
}
