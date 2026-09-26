import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';

void main() {
  group('OrderListEntity.toJson', () {
    test('sends the search term using the q query parameter', () {
      const entity = OrderListEntity(
        status: 'DRAFT',
        query: '  FR-5  ',
        page: 2,
        pageSize: 10,
      );

      expect(entity.toJson(), {
        'status': 'DRAFT',
        'q': 'FR-5',
        'page': 2,
        'pageSize': 10,
      });
    });

    test('omits q when the search term is empty', () {
      const entity = OrderListEntity(query: '   ');

      expect(entity.toJson(), {'page': 1, 'pageSize': 20});
    });
  });
}
