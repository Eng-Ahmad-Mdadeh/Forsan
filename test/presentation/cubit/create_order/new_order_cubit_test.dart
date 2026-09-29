import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';

void main() {
  group('NewOrderCubit agreements', () {
    late NewOrderCubit cubit;

    setUp(() => cubit = NewOrderCubit());
    tearDown(() => cubit.close());

    test('stores the accuracy acknowledgement in the order entity', () {
      cubit.setAcknowledgesAccuracy(true);

      expect(cubit.state.orderEntity.acknowledgesAccuracy, isTrue);
    });

    test('stores the terms acceptance in the order entity', () {
      cubit.setAcceptsTerms(true);

      expect(cubit.state.orderEntity.acceptsTerms, isTrue);
    });
  });
}
