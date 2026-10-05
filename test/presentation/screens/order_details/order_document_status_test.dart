import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/presentation/screens/order_details/widgets/order_document_item.dart';

void main() {
  group('OrderDocumentStatus.fromApi', () {
    test('maps supported backend values', () {
      expect(
        OrderDocumentStatus.fromApi('approved'),
        OrderDocumentStatus.approved,
      );
      expect(
        OrderDocumentStatus.fromApi('rejected'),
        OrderDocumentStatus.rejected,
      );
      expect(
        OrderDocumentStatus.fromApi('under_review'),
        OrderDocumentStatus.underReview,
      );
      expect(
        OrderDocumentStatus.fromApi('required'),
        OrderDocumentStatus.required,
      );
      expect(
        OrderDocumentStatus.fromApi('not_required'),
        OrderDocumentStatus.notRequired,
      );
    });

    test('normalizes camel case, whitespace, and aliases', () {
      expect(
        OrderDocumentStatus.fromApi('underReview'),
        OrderDocumentStatus.underReview,
      );
      expect(
        OrderDocumentStatus.fromApi(' NOT-REQUIRED '),
        OrderDocumentStatus.notRequired,
      );
      expect(
        OrderDocumentStatus.fromApi('accepted'),
        OrderDocumentStatus.approved,
      );
      expect(
        OrderDocumentStatus.fromApi('pending'),
        OrderDocumentStatus.underReview,
      );
    });

    test('uses a neutral fallback for missing and unsupported values', () {
      expect(OrderDocumentStatus.fromApi(null), OrderDocumentStatus.unknown);
      expect(OrderDocumentStatus.fromApi(''), OrderDocumentStatus.unknown);
      expect(
        OrderDocumentStatus.fromApi('new_backend_status'),
        OrderDocumentStatus.unknown,
      );
    });
  });
}
