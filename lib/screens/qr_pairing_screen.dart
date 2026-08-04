import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:kabelos/controllers/wifi_direct_controller.dart';
import 'package:kabelos/models/wifi_direct_models.dart';
import 'package:kabelos/l10n/app_localizations.dart';

class QrPairingScreen extends StatefulWidget {
  final WiFiDirectController controller;
  final WiFiDirectState state;

  const QrPairingScreen({
    super.key,
    required this.controller,
    required this.state,
  });

  @override
  State<QrPairingScreen> createState() => _QrPairingScreenState();
}

class _QrPairingScreenState extends State<QrPairingScreen> {
  bool _showMyCode = false;
  bool _scanning = false;
  Map<String, dynamic> _qrPayload = {};

  @override
  void initState() {
    super.initState();
    _loadQrPayload();
  }

  Future<void> _loadQrPayload() async {
    final result = await widget.controller.getQrPayload();
    if (mounted) {
      setState(() => _qrPayload = result);
    }
  }

  String _generateQrContent() {
    final name =
        _qrPayload['deviceName']?.toString() ?? widget.state.deviceName;
    final code =
        _qrPayload['pairingCode']?.toString() ??
        _qrPayload['pairingId']?.toString() ??
        '00000000';
    return 'Kabelos:$name:$code';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pairingCode =
        _qrPayload['pairingCode']?.toString() ??
        _qrPayload['pairingId']?.toString() ??
        '00000000';

    return Scaffold(
      appBar: AppBar(title: Text(l10n.qrPairingTitle)),
      body: _showMyCode
          ? _buildShowCode(l10n, pairingCode)
          : _buildScanMode(l10n),
    );
  }

  Widget _buildShowCode(AppLocalizations l10n, String pairingCode) {
    final deviceName =
        _qrPayload['deviceName']?.toString() ?? widget.state.deviceName;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.qrPairingYourCode,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
              child: QrImageView(
                data: _generateQrContent(),
                version: QrVersions.auto,
                size: 200,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            const SizedBox(height: 24),
            _infoRow(context, l10n.qrPairingDeviceName, deviceName),
            _infoRow(context, l10n.qrPairingPairingCode, pairingCode),
            const SizedBox(height: 24),
            Text(
              l10n.qrPairingNote,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanMode(AppLocalizations l10n) {
    if (!_scanning) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.qrPairingSubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() => _scanning = true);
                  _startScan();
                },
                icon: const Icon(Icons.qr_code_scanner),
                label: Text(l10n.qrPairingScanCode),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () => setState(() => _showMyCode = true),
                icon: const Icon(Icons.qr_code),
                label: Text(l10n.qrPairingShowCode),
              ),
            ),
          ],
        ),
      );
    }

    return MobileScanner(
      onDetect: (capture) {
        final code = capture.barcodes.first.rawValue ?? '';
        if (code.isNotEmpty && mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.qrPairingScanResult(code, code))),
          );
        }
      },
    );
  }

  void _startScan() {
    setState(() => _scanning = true);
  }

  Widget _infoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$label:',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
