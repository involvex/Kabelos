import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/wifi_direct_models.dart';
import '../controllers/wifi_direct_controller.dart';
import '../l10n/app_localizations.dart';
import '../screens/setup_check_screen.dart';
import '../screens/device_info_screen.dart';
import '../screens/qr_pairing_screen.dart';

class ConnectionTab extends StatelessWidget {
  final WiFiDirectController controller;
  final WiFiDirectState state;

  const ConnectionTab({
    super.key,
    required this.controller,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // WiFi P2P Status
          _buildWifiP2pStatus(context),
          // Connection Status
          _buildConnectionStatus(context),
          // Control Buttons
          _buildControlButtons(context),
          // Peers List
          SizedBox(height: 300, child: _buildPeersList(context)),
          // Logs Section
          _buildLogsSection(context),
        ],
      ),
    );
  }

  Widget _buildWifiP2pStatus(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final statusText = !state.isWifiP2pEnabled
        ? l10n.connectionStatusWifiOff
        : state.isDiscovering
        ? l10n.scanning
        : state.isForegroundServiceRunning || state.isServiceRegistered
        ? l10n.readyForConnections
        : state.nativeWifiDirectState;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: state.isWifiP2pEnabled
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.red.withValues(alpha: 0.1),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            state.isWifiP2pEnabled ? Icons.wifi : Icons.wifi_off,
            color: state.isWifiP2pEnabled ? Colors.green : Colors.red,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wi-Fi Direct',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  statusText,
                  style: TextStyle(
                    color: state.isWifiP2pEnabled ? Colors.green : Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (state.lastNativeError != null)
                  Text(
                    state.lastNativeError!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionStatus(BuildContext context) {
    final hasWifiDirectLink = state.hasWifiDirectLink;
    final statusText = hasWifiDirectLink
        ? '${AppLocalizations.of(context)!.connected} / ${state.sessionState}'
        : state.isConnecting
        ? 'Connecting to ${_pendingPeerLabel()}'
        : AppLocalizations.of(context)!.disconnected;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Row(
        children: [
          Icon(
            state.isSessionReady ? Icons.link : Icons.link_off,
            color: state.isSessionReady ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${AppLocalizations.of(context)!.connectionStatus}: $statusText',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: state.isDiscovering
                      ? null
                      : controller.discoverPeers,
                  icon: state.isDiscovering
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.search),
                  label: Text(
                    state.isDiscovering
                        ? AppLocalizations.of(context)!.scanning
                        : AppLocalizations.of(context)!.scanForDevices,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: controller.stopDiscovery,
                  icon: const Icon(Icons.stop),
                  label: Text(AppLocalizations.of(context)!.stopScan),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SetupCheckScreen(
                          controller: controller,
                          state: state,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.checklist),
                  label: Text(
                    AppLocalizations.of(context)!.connectionSetupCheck,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => QrPairingScreen(
                          controller: controller,
                          state: state,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                  label: Text(
                    AppLocalizations.of(context)!.connectionQrPairing,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DeviceInfoScreen(
                          controller: controller,
                          state: state,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.info),
                  label: Text(
                    AppLocalizations.of(context)!.connectionDeviceInfo,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeersList(BuildContext context) {
    if (state.peers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.devices_other, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.noDevicesFound,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.tapScanForDevices,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              AppLocalizations.of(
                context,
              )!.availableDevices(state.peers.length),
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: state.peers.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.2),
              ),
              itemBuilder: (context, index) {
                final peer = state.peers[index];
                final action = _getPeerAction(context, peer);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getStatusColor(peer.status),
                    child: Icon(
                      Icons.device_hub,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  title: Text(
                    peer.deviceName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        peer.deviceAddress,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(
                            peer.status,
                          ).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          peer.statusText,
                          style: TextStyle(
                            fontSize: 10,
                            color: _getStatusColor(peer.status),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (peer.isWdCablePeer)
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            'Kabelos peer',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: action.enabled
                        ? () => controller.connectToPeer(peer)
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      minimumSize: Size.zero,
                    ),
                    child: Text(
                      action.label,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _PeerAction _getPeerAction(BuildContext context, WiFiDirectDevice peer) {
    final isPendingPeer =
        state.isConnecting && state.pendingPeerAddress == peer.deviceAddress;
    final isConnectedPeer = peer.status == 0;
    final isInvitedPeer = peer.status == 1;

    if (isConnectedPeer) {
      return _PeerAction(AppLocalizations.of(context)!.connected, false);
    }

    if (isPendingPeer) {
      return const _PeerAction('Connecting...', false);
    }

    if (isInvitedPeer) {
      return const _PeerAction('Invited', false);
    }

    if (state.isConnecting || state.hasWifiDirectLink) {
      return _PeerAction(AppLocalizations.of(context)!.connect, false);
    }

    return _PeerAction(AppLocalizations.of(context)!.connect, true);
  }

  String _pendingPeerLabel() {
    final pendingAddress = state.pendingPeerAddress;
    if (pendingAddress == null || pendingAddress.isEmpty) {
      return 'peer';
    }
    for (final peer in state.peers) {
      if (peer.deviceAddress == pendingAddress && peer.deviceName.isNotEmpty) {
        return peer.deviceName;
      }
    }
    return pendingAddress;
  }

  Widget _buildLogsSection(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.terminal, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.systemLogs,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Copy diagnostics',
                  icon: const Icon(Icons.copy, size: 18),
                  onPressed: () => _copyDiagnostics(context),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
          Expanded(
            child: state.logs.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.noLogsYet,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: SelectableText(
                      state.logs.join('\n'),
                      style: const TextStyle(
                        fontSize: 11,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> _copyDiagnostics(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final logs = await controller.getDiagnosticLogs();
      await Clipboard.setData(ClipboardData(text: logs));
      messenger.showSnackBar(
        const SnackBar(content: Text('Diagnostics copied')),
      );
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text('Failed to copy diagnostics: $e')),
      );
    }
  }

  Color _getStatusColor(int status) {
    switch (status) {
      case 0: // Connected
        return Colors.green;
      case 1: // Invited
        return Colors.orange;
      case 2: // Failed
        return Colors.red;
      case 3: // Available
        return Colors.blue;
      case 4: // Unavailable
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

class _PeerAction {
  final String label;
  final bool enabled;

  const _PeerAction(this.label, this.enabled);
}
