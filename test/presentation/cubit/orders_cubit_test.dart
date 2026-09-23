import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/presentation/cubit/orders/orders_cubit.dart';

void main() {
  group('OrdersCubit', () {
    test('updates the selected status and request entity', () {
      final cubit = OrdersCubit();

      cubit.selectStatus(1);

      expect(cubit.state, 1);
      expect(cubit.entity.status, 'UNDER_REVIEW');

      cubit.selectStatus(0);

      expect(cubit.state, 0);
      expect(cubit.entity.status, isNull);
    });

    test('keeps the selected status when the search query changes', () {
      final cubit = OrdersCubit()
        ..selectStatus(2)
        ..updateQuery('  FR-2026  ');

      expect(cubit.entity.status, 'WAITING_DOCUMENTS');
      expect(cubit.entity.query, 'FR-2026');
    });
  });
}
