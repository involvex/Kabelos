import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kabelos/controllers/wifi_direct_controller.dart';
import 'package:kabelos/models/wifi_direct_models.dart';
import 'package:kabelos/l10n/app_localizations.dart';

class DeviceInfoScreen extends StatefulWidget {
  final WiFiDirectController controller;
  final WiFiDirectState state;

  const DeviceInfoScreen({
    super.key,
    required this.controller,
    required this.state,
  });

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  bool _loading = false;

  Future<void> _refreshDiagnostics() async {
    setState(() => _loading = true);
    await widget.controller.refreshDiagnostics();
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _copyDetails() async {
    final l10n = AppLocalizations.of(context)!;
    final buffer = StringBuffer();
    buffer.writeln('Device: ${widget.state.deviceName}');
    buffer.writeln('Android: ${widget.state.androidVersion}');
    buffer.writeln('App: ${widget.state.appVersion}');
    buffer.writeln('Wi-Fi Direct: ${widget.state.nativeWifiDirectState}');
    if (widget.state.connectionInfo != null) {
      final ci = widget.state.connectionInfo!;
      buffer.writeln('Connected: ${ci.isConnected}');
      buffer.writeln(
        'Group Owner: ${ci.isGroupOwner ? l10n.deviceInfoGroupOwner : l10n.deviceInfoClient}',
      );
      buffer.writeln('Go Address: ${ci.groupOwnerAddress ?? "N/A"}');
      buffer.writeln('Peer: ${ci.peerName ?? "N/A"}');
    }
    buffer.writeln('Session State: ${widget.state.sessionState}');
    buffer.writeln(
      'Foreground Service: ${widget.state.isForegroundServiceRunning ? l10n.deviceInfoRunning : l10n.deviceInfoStopped}',
    );
    buffer.writeln(
      'Wi-Fi Lock: ${widget.state.isWifiLockHeld ? l10n.deviceInfoHeld : l10n.deviceInfoNotHeld}',
    );
    buffer.writeln(
      'Wake Lock: ${widget.state.isWakeLockHeld ? l10n.deviceInfoHeld : l10n.deviceInfoNotHeld}',
    );

    await Clipboard.setData(ClipboardData(text: buffer.toString()));
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.deviceInfoCopied)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final s = widget.state;
    final ci = s.connectionInfo;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.deviceInfoTitle),
        actions: [
          IconButton(
            icon: _loading
                ? const SizedBox.square(
                    dimension: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            onPressed: _loading ? null : _refreshDiagnostics,
          ),
          IconButton(icon: const Icon(Icons.copy), onPressed: _copyDetails),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(context, l10n.deviceInfoThisDevice),
            _infoRow(context, l10n.deviceInfoDeviceName, s.deviceName),
            _infoRow(context, l10n.deviceInfoModel, s.deviceModel),
            _infoRow(context, l10n.deviceInfoAndroidVersion, s.androidVersion),
            _infoRow(context, l10n.deviceInfoAppVersion, s.appVersion),
            _infoRow(
              context,
              l10n.deviceInfoWifiDirectStatus,
              s.nativeWifiDirectState,
            ),
            const SizedBox(height: 16),
            _sectionTitle(context, l10n.deviceInfoConnectedPeer),
            if (ci != null && ci.isConnected) ...[
              _infoRow(
                context,
                l10n.deviceInfoDeviceName,
                ci.peerName ?? 'N/A',
              ),
              _infoRow(
                context,
                l10n.deviceInfoNetworkAddress,
                ci.groupOwnerAddress ?? 'N/A',
              ),
              _infoRow(
                context,
                l10n.deviceInfoIsGroupOwner,
                ci.isGroupOwner
                    ? l10n.deviceInfoGroupOwner
                    : l10n.deviceInfoClient,
              ),
            ] else
              Text(
                l10n.notConnected,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
                ),
              ),
            const SizedBox(height: 16),
            _sectionTitle(context, l10n.setupCheckTitle),
            _infoRow(
              context,
              l10n.deviceInfoForegroundService,
              s.isForegroundServiceRunning
                  ? l10n.deviceInfoRunning
                  : l10n.deviceInfoStopped,
            ),
            _infoRow(
              context,
              l10n.deviceInfoWifiLock,
              s.isWifiLockHeld ? l10n.deviceInfoHeld : l10n.deviceInfoNotHeld,
            ),
            _infoRow(
              context,
              l10n.deviceInfoWakeLock,
              s.isWakeLockHeld ? l10n.deviceInfoHeld : l10n.deviceInfoNotHeld,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _infoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
