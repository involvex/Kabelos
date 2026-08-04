import 'package:flutter/widgets.dart';
import '../l10n/app_localizations.dart';

class ErrorMessages {
  ErrorMessages._();

  /// Maps a native error reason code (from Kotlin) to the corresponding
  /// localized title key in the ARB files.
  ///
  /// Returns a record with `titleKey` and `bodyKey` — both keys are
  /// guaranteed to exist in every locale's ARB file, or empty strings
  /// for reasons that should be silently ignored.
  static ({String titleKey, String bodyKey}) mapReason(String reason) {
    switch (reason) {
      case 'peer_protocol_missing':
      case 'protocol_mismatch':
        return (
          titleKey: 'errorPeerProtocolMissingTitle',
          bodyKey: 'errorPeerProtocolMissing',
        );

      case 'session_failed':
      case 'control_channel_failed':
      case 'bulk_channel_failed':
      case 'peer_closed':
      case 'peer_error':
      case 'handshake_timeout':
        return (
          titleKey: 'errorSessionFailedTitle',
          bodyKey: 'errorSessionFailed',
        );

      case 'wifi_direct_group_lost':
      case 'wifi_direct_disconnected':
      case 'wifi_direct_reconnected':
      case 'missing_group_owner_address':
      case 'heartbeat_timeout':
      case 'heartbeat_send_failed':
        return (
          titleKey: 'errorWifiDirectGroupLostTitle',
          bodyKey: 'errorWifiDirectGroupLost',
        );

      case 'permission_denied':
      case 'PERMISSION_DENIED':
      case 'SCAN_REJECTED':
        return (
          titleKey: 'errorPermissionDeniedTitle',
          bodyKey: 'errorPermissionDenied',
        );

      case 'connection_failed':
      case 'CONNECTION_FAILED':
        return (
          titleKey: 'errorSessionFailedTitle',
          bodyKey: 'errorSessionFailed',
        );

      case 'CONNECT_REJECTED':
      case 'connection_rejected':
        return (
          titleKey: 'errorConnectionRejectedTitle',
          bodyKey: 'errorConnectionRejected',
        );

      case 'tcp_connect_timeout':
      case 'connection_timeout':
        return (
          titleKey: 'errorConnectionTimeoutTitle',
          bodyKey: 'errorConnectionTimeout',
        );

      case 'WIFI_P2P_UNAVAILABLE':
      case 'wifi_off':
        return (titleKey: 'errorWifiOffTitle', bodyKey: 'errorWifiOff');

      case 'local_disconnect':
      case 'app_destroyed':
      case 'cancelled':
        return (titleKey: '', bodyKey: '');

      default:
        if (reason.startsWith('file_') || reason == 'transfer_failed') {
          return (
            titleKey: 'errorFileTransferFailedTitle',
            bodyKey: 'errorFileTransferFailed',
          );
        }
        if (reason.startsWith('audio_')) {
          return (
            titleKey: 'errorAudioNotSupportedTitle',
            bodyKey: 'errorAudioNotSupported',
          );
        }
        return (titleKey: 'errorUnknownTitle', bodyKey: 'errorUnknown');
    }
  }

  /// Resolves a mapped reason into the localized user-facing body text.
  ///
  /// Returns `null` when the reason should not display a user message
  /// (e.g. intentional local disconnect, app teardown, cancelled).
  static String? localizeBody(BuildContext context, String reason) {
    final mapped = mapReason(reason);
    final bodyKey = mapped.bodyKey;
    if (bodyKey.isEmpty) return null;

    final loc = AppLocalizations.of(context);
    if (loc == null) return null;

    switch (bodyKey) {
      case 'errorPeerProtocolMissing':
        return loc.errorPeerProtocolMissing;
      case 'errorSessionFailed':
        return loc.errorSessionFailed;
      case 'errorWifiDirectGroupLost':
        return loc.errorWifiDirectGroupLost;
      case 'errorPermissionDenied':
        return loc.errorPermissionDenied;
      case 'errorConnectionRejected':
        return loc.errorConnectionRejected;
      case 'errorConnectionTimeout':
        return loc.errorConnectionTimeout;
      case 'errorWifiOff':
        return loc.errorWifiOff;
      case 'errorFileTransferFailed':
        return loc.errorFileTransferFailed;
      case 'errorAudioNotSupported':
        return loc.errorAudioNotSupported;
      default:
        return loc.errorUnknown;
    }
  }

  static String? localizeTitle(BuildContext context, String reason) {
    final mapped = mapReason(reason);
    final titleKey = mapped.titleKey;
    if (titleKey.isEmpty) return null;

    final loc = AppLocalizations.of(context);
    if (loc == null) return null;

    switch (titleKey) {
      case 'errorPeerProtocolMissingTitle':
        return loc.errorPeerProtocolMissingTitle;
      case 'errorSessionFailedTitle':
        return loc.errorSessionFailedTitle;
      case 'errorWifiDirectGroupLostTitle':
        return loc.errorWifiDirectGroupLostTitle;
      case 'errorPermissionDeniedTitle':
        return loc.errorPermissionDeniedTitle;
      case 'errorConnectionRejectedTitle':
        return loc.errorConnectionRejectedTitle;
      case 'errorConnectionTimeoutTitle':
        return loc.errorConnectionTimeoutTitle;
      case 'errorWifiOffTitle':
        return loc.errorWifiOffTitle;
      case 'errorFileTransferFailedTitle':
        return loc.errorFileTransferFailedTitle;
      case 'errorAudioNotSupportedTitle':
        return loc.errorAudioNotSupportedTitle;
      default:
        return loc.errorUnknownTitle;
    }
  }

  /// Returns a user-friendly localized label for the internal session state
  /// machine values (e.g. "Ready", "Active", "Failed", "Degraded").
  ///
  /// Falls back to the raw value (in title case) when the state is unknown
  /// or localization is unavailable.
  static String localizeSessionState(BuildContext context, String state) {
    final loc = AppLocalizations.of(context);
    if (loc == null) return _titleCase(state);

    switch (state) {
      case 'Ready':
        return loc.connectionStatusReady;
      case 'Active':
        return loc.connectionStatus;
      case 'Failed':
        return loc.errorSessionFailedTitle;
      case 'Degraded':
        return loc.errorWifiDirectGroupLostTitle;
      case 'Disabled':
        return loc.connectionStatusDisabled;
      case 'Idle':
      case 'Connecting':
      case 'Listening':
        return _titleCase(state);
      default:
        return _titleCase(state);
    }
  }

  static String _titleCase(String value) {
    if (value.isEmpty) return value;
    return value[0].toUpperCase() + value.substring(1);
  }
}
