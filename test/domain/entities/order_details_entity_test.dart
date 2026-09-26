import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/domain/entities/order_details/order_details_entity.dart';

void main() {
  group('OrderDetailsEntity.requestIdentifier', () {
    test('uses the request ID when it is available', () {
      const entity = OrderDetailsEntity(
        requestId: 'request-id',
        requestReference: 'request-reference',
      );

      expect(entity.requestIdentifier, 'request-id');
      expect(entity.toJson(), {'id': 'request-id'});
    });

    test('falls back to the request reference and trims it', () {
      const entity = OrderDetailsEntity(
        requestId: '  ',
        requestReference: ' request-reference ',
      );

      expect(entity.requestIdentifier, 'request-reference');
      expect(entity.toJson(), {'id': 'request-reference'});
    });

    test('returns null when neither identifier has a value', () {
      const entity = OrderDetailsEntity(requestReference: '  ');

      expect(entity.requestIdentifier, isNull);
      expect(entity.toJson(), isEmpty);
    });
  });
}
