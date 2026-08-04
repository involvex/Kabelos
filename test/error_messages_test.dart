import 'package:flutter_test/flutter_test.dart';
import 'package:kabelos/utils/error_messages.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ErrorMessages.mapReason', () {
    test('peer_protocol_missing maps to errorPeerProtocolMissing', () {
      final mapped = ErrorMessages.mapReason('peer_protocol_missing');
      expect(mapped.titleKey, 'errorPeerProtocolMissingTitle');
      expect(mapped.bodyKey, 'errorPeerProtocolMissing');
    });

    test('session_failed maps to errorSessionFailed', () {
      final mapped = ErrorMessages.mapReason('session_failed');
      expect(mapped.titleKey, 'errorSessionFailedTitle');
      expect(mapped.bodyKey, 'errorSessionFailed');
    });

    test('handshake_timeout maps to errorSessionFailed', () {
      final mapped = ErrorMessages.mapReason('handshake_timeout');
      expect(mapped.titleKey, 'errorSessionFailedTitle');
      expect(mapped.bodyKey, 'errorSessionFailed');
    });

    test('wifi_direct_group_lost maps to errorWifiDirectGroupLost', () {
      final mapped = ErrorMessages.mapReason('wifi_direct_group_lost');
      expect(mapped.titleKey, 'errorWifiDirectGroupLostTitle');
      expect(mapped.bodyKey, 'errorWifiDirectGroupLost');
    });

    test('heartbeat_timeout maps to errorWifiDirectGroupLost', () {
      final mapped = ErrorMessages.mapReason('heartbeat_timeout');
      expect(mapped.titleKey, 'errorWifiDirectGroupLostTitle');
      expect(mapped.bodyKey, 'errorWifiDirectGroupLost');
    });

    test('permission_denied maps to errorPermissionDenied', () {
      final mapped = ErrorMessages.mapReason('permission_denied');
      expect(mapped.titleKey, 'errorPermissionDeniedTitle');
      expect(mapped.bodyKey, 'errorPermissionDenied');
    });

    test('PERMISSION_DENIED (uppercase) maps to errorPermissionDenied', () {
      final mapped = ErrorMessages.mapReason('PERMISSION_DENIED');
      expect(mapped.titleKey, 'errorPermissionDeniedTitle');
      expect(mapped.bodyKey, 'errorPermissionDenied');
    });

    test('SCAN_REJECTED maps to errorPermissionDenied', () {
      final mapped = ErrorMessages.mapReason('SCAN_REJECTED');
      expect(mapped.titleKey, 'errorPermissionDeniedTitle');
      expect(mapped.bodyKey, 'errorPermissionDenied');
    });

    test('connection_rejected maps to errorConnectionRejected', () {
      final mapped = ErrorMessages.mapReason('connection_rejected');
      expect(mapped.titleKey, 'errorConnectionRejectedTitle');
      expect(mapped.bodyKey, 'errorConnectionRejected');
    });

    test('tcp_connect_timeout maps to errorConnectionTimeout', () {
      final mapped = ErrorMessages.mapReason('tcp_connect_timeout');
      expect(mapped.titleKey, 'errorConnectionTimeoutTitle');
      expect(mapped.bodyKey, 'errorConnectionTimeout');
    });

    test('wifi_off maps to errorWifiOff', () {
      final mapped = ErrorMessages.mapReason('wifi_off');
      expect(mapped.titleKey, 'errorWifiOffTitle');
      expect(mapped.bodyKey, 'errorWifiOff');
    });

    test('local_disconnect returns empty keys (no user message)', () {
      final mapped = ErrorMessages.mapReason('local_disconnect');
      expect(mapped.titleKey, '');
      expect(mapped.bodyKey, '');
    });

    test('cancelled returns empty keys (no user message)', () {
      final mapped = ErrorMessages.mapReason('cancelled');
      expect(mapped.titleKey, '');
      expect(mapped.bodyKey, '');
    });

    test('app_destroyed returns empty keys (no user message)', () {
      final mapped = ErrorMessages.mapReason('app_destroyed');
      expect(mapped.titleKey, '');
      expect(mapped.bodyKey, '');
    });

    test('file_* prefix maps to errorFileTransferFailed', () {
      final mapped = ErrorMessages.mapReason('file_send_failed');
      expect(mapped.titleKey, 'errorFileTransferFailedTitle');
      expect(mapped.bodyKey, 'errorFileTransferFailed');
    });

    test('transfer_failed maps to errorFileTransferFailed', () {
      final mapped = ErrorMessages.mapReason('transfer_failed');
      expect(mapped.titleKey, 'errorFileTransferFailedTitle');
      expect(mapped.bodyKey, 'errorFileTransferFailed');
    });

    test('audio_* prefix maps to errorAudioNotSupported', () {
      final mapped = ErrorMessages.mapReason('audio_encoder_missing');
      expect(mapped.titleKey, 'errorAudioNotSupportedTitle');
      expect(mapped.bodyKey, 'errorAudioNotSupported');
    });

    test('unknown reason maps to errorUnknown', () {
      final mapped = ErrorMessages.mapReason('some_arbitrary_reason');
      expect(mapped.titleKey, 'errorUnknownTitle');
      expect(mapped.bodyKey, 'errorUnknown');
    });
  });
}
