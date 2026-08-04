import 'package:flutter/material.dart';
import 'package:kabelos/controllers/wifi_direct_controller.dart';
import 'package:kabelos/models/wifi_direct_models.dart';
import 'package:kabelos/l10n/app_localizations.dart';

class SetupCheckScreen extends StatefulWidget {
  final WiFiDirectController controller;
  final WiFiDirectState state;

  const SetupCheckScreen({
    super.key,
    required this.controller,
    required this.state,
  });

  @override
  State<SetupCheckScreen> createState() => _SetupCheckScreenState();
}

class _SetupCheckScreenState extends State<SetupCheckScreen> {
  bool _running = false;
  Map<String, dynamic> _results = {};

  @override
  void initState() {
    super.initState();
    _runCheck();
  }

  Future<void> _runCheck() async {
    setState(() => _running = true);
    try {
      final results = await widget.controller.runSetupCheck();
      if (mounted) {
        setState(() {
          _running = false;
          _results = results;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _running = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.setupCheckTitle),
        actions: [
          IconButton(
            icon: _running
                ? const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            onPressed: _running ? null : _runCheck,
          ),
        ],
      ),
      body: _running
          ? const Center(child: CircularProgressIndicator())
          : _buildResults(),
    );
  }

  Widget _buildResults() {
    final l10n = AppLocalizations.of(context)!;
    final checks = _buildChecks();
    final allPassed = checks.every((c) => c.passed);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.setupCheckSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 20),
          ...checks.map((check) => _buildCheckItem(l10n, check)),
          const SizedBox(height: 24),
          if (allPassed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.setupCheckAllGood,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.error.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.setupCheckSomeFailed,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<_SetupCheckItem> _buildChecks() {
    final wifiOn = _results['wifiOn'] == true;
    final wifiDirectReady = _results['wifiDirectReady'] == true;
    final nearbyPermission = _results['nearbyPermission'] == true;
    final foregroundService = _results['foregroundService'] == true;
    final wifiLock = _results['wifiLock'] == true;
    final wakeLock = _results['wakeLock'] == true;
    final samsungNearby = _results['samsungNearbyScanning'] == true;

    return [
      _SetupCheckItem(label: 'Wi-Fi is on', passed: wifiOn),
      _SetupCheckItem(label: 'Wi-Fi Direct ready', passed: wifiDirectReady),
      _SetupCheckItem(
        label: 'Nearby devices permission',
        passed: nearbyPermission,
      ),
      _SetupCheckItem(
        label: 'Background service running',
        passed: foregroundService,
      ),
      _SetupCheckItem(label: 'Wi-Fi lock held', passed: wifiLock),
      _SetupCheckItem(label: 'Wake lock held', passed: wakeLock),
      _SetupCheckItem(
        label: 'Samsung nearby scanning (One UI)',
        passed: samsungNearby,
        optional: true,
      ),
    ];
  }

  Widget _buildCheckItem(AppLocalizations l10n, _SetupCheckItem check) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            check.passed ? Icons.check_circle : Icons.warning,
            color: check.passed
                ? Colors.green
                : Theme.of(context).colorScheme.error,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  check.label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (check.optional)
                  Text(
                    'Optional',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                    ),
                  ),
                if (!check.passed)
                  Text(
                    'Needs attention',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
          if (!check.passed)
            TextButton(
              onPressed: () => _fixItem(check, l10n),
              child: Text(l10n.setupCheckFixIt),
            ),
        ],
      ),
    );
  }

  void _fixItem(_SetupCheckItem check, AppLocalizations l10n) {
    if (check.label.contains('Wi-Fi') && check.label.contains('Direct')) {
      widget.controller.openWifiSettings();
    } else if (check.label.contains('Nearby')) {
      widget.controller.openNearbyDevicesSettings();
    } else if (check.label.contains('service')) {
      widget.controller.startForegroundService();
    } else {
      widget.controller.openAppSettings();
    }
  }
}

class _SetupCheckItem {
  final String label;
  final bool passed;
  final bool optional;

  _SetupCheckItem({
    required this.label,
    required this.passed,
    this.optional = false,
  });
}
