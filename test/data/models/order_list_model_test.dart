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
        'all': 10,
        'DRAFT': 1,
        'UNDER_REVIEW': 2,
        'AWAITING_DOCUMENTS': 3,
        'QUOTE_READY': 4,
        'AWAITING_PAYMENT': 5,
        'PAYMENT_UNDER_REVIEW': 6,
        'IN_PROGRESS': 7,
        'DELIVERED': 8,
        'COMPLETED': 9,
        'CANCELLED': 10,
      },
    });

    expect(model.pagination.items?.single.id, 'order-1');
    expect(model.pagination.page, 1);
    expect(model.pagination.pageSize, 20);
    expect(model.pagination.total, 1);
    expect(model.counts?.all, 10);
    expect(model.counts?.draft, 1);
    expect(model.counts?.underReview, 2);
    expect(model.counts?.awaitingDocuments, 3);
    expect(model.counts?.quoteReady, 4);
    expect(model.counts?.awaitingPayment, 5);
    expect(model.counts?.paymentUnderReview, 6);
    expect(model.counts?.inProgress, 7);
    expect(model.counts?.delivered, 8);
    expect(model.counts?.completed, 9);
    expect(model.counts?.cancelled, 10);
  });
}
