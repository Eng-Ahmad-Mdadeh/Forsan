import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';

void main() {
  test('separates page metadata from order-specific counts', () {
    final model = OrderListModel.fromJson({
      'items': [
        {
          'id': 'order-1',
          'reference': 'FR-2026-1',
          'serviceName': 'Service',
          'categoryName': 'Category',
          'status': 'SUBMITTED',
          'displayStatus': 'UNDER_REVIEW',
          'statusLabel': 'Under review',
          'progress': 17,
          'createdAt': '2026-09-23T09:13:07.226Z',
          'consultant': null,
        },
      ],
      'page': 1,
      'pageSize': 20,
      'total': 1,
      'counts': {
        'all': 1,
        'UNDER_REVIEW': 1,
        'WAITING_DOCUMENTS': 0,
      },
    });

    expect(model.pagination.items?.single.id, 'order-1');
    expect(model.pagination.page, 1);
    expect(model.pagination.pageSize, 20);
    expect(model.pagination.total, 1);
    expect(model.counts?.all, 1);
    expect(model.counts?.underReview, 1);
    expect(model.counts?.waitingDocuments, 0);
  });
}
