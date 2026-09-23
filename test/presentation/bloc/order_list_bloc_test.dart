import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/data/models/pagination/page_pagination_model.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:forsan/presentation/bloc/order_list/order_list_bloc.dart';

void main() {
  group('OrderListBloc', () {
    late _OrderListUseCase useCase;
    late OrderListBloc bloc;

    setUp(() {
      useCase = _OrderListUseCase();
      bloc = OrderListBloc(useCase);
    });

    tearDown(() => bloc.close());

    test('loads the first page and replaces existing pagination data', () async {
      useCase.responses.add(Right(_response(items: [_item('1')], total: 2)));

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder([
          isA<OrderListLoading>(),
          isA<OrderListLoaded>()
              .having((state) => state.items.length, 'items length', 1),
        ]),
      );

      bloc.add(const GetOrderListEvent(OrderListEntity(page: 7)));
      await expectation;

      expect(useCase.params.single.page, 1);
      expect(bloc.canLoadMore, isTrue);
    });

    test('loads the next page and emits accumulated unique items', () async {
      useCase.responses
        ..add(Right(_response(items: [_item('1')], total: 2)))
        ..add(
          Right(
            _response(
              items: [_item('1'), _item('2')],
              page: 2,
              total: 2,
            ),
          ),
        );

      bloc.add(const GetOrderListEvent(OrderListEntity()));
      await bloc.stream.firstWhere((state) => state is OrderListLoaded);

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder([
          isA<OrderListLoaded>()
              .having((state) => state.items.length, 'items length', 2),
        ]),
      );

      bloc.add(const LoadMoreOrderListEvent(OrderListEntity()));
      await expectation;

      expect(useCase.params.last.page, 2);
      expect(bloc.canLoadMore, isFalse);
      expect(bloc.isLoadingMore, isFalse);
    });
  });
}

BaseModel<OrderListModel> _response({
  required List<Item> items,
  int page = 1,
  required int total,
}) {
  return BaseModel<OrderListModel>(
    data: OrderListModel(
      pagination: PagePaginationModel<Item>(
        items: items,
        page: page,
        pageSize: 1,
        total: total,
      ),
      counts: Counts(all: total, underReview: total),
    ),
  );
}

Item _item(String id) {
  return Item(
    id: id,
    reference: 'reference-$id',
    serviceName: 'service',
    categoryName: 'category',
    status: 'SUBMITTED',
    displayStatus: 'UNDER_REVIEW',
    statusLabel: 'Under review',
    progress: 17,
    createdAt: DateTime(2026),
    consultant: null,
  );
}

class _OrderListUseCase
    implements IUseCase<BaseModel<OrderListModel>?, OrderListEntity> {
  final List<Either<AppException, BaseModel<OrderListModel>?>> responses = [];
  final List<OrderListEntity> params = [];

  @override
  Future<Either<AppException, BaseModel<OrderListModel>?>> call(
    OrderListEntity params,
  ) async {
    this.params.add(params);
    return responses.removeAt(0);
  }
}
