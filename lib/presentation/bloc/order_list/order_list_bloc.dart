import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/core/utils/pagination/base_pagination_bloc.dart';
import 'package:forsan/core/utils/pagination/page_pagination_controller.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'order_list_event.dart';
part 'order_list_state.dart';

class OrderListBloc extends Bloc<IOrderListEvent, IOrderListState>
    with BasePaginationBloc<Item, String> {
  OrderListBloc({
    IUseCase<BaseModel<OrderListModel>?, OrderListEntity>? getOrderList,
  }) : _getOrderList =
           getOrderList ??
           locator<IUseCase<BaseModel<OrderListModel>?, OrderListEntity>>(
             instanceName: 'OrderList',
           ),
       super(const OrderListInitial()) {
    on<GetOrderListEvent>(_getOrders);
    on<LoadMoreOrderListEvent>(_loadMore);
  }

  final IUseCase<BaseModel<OrderListModel>?, OrderListEntity> _getOrderList;

  @override
  final PagePaginationController<Item, String> paginationController =
      PagePaginationController<Item, String>(identifier: (item) => item.id);
  int _requestVersion = 0;

  FutureOr<void> _getOrders(
    GetOrderListEvent event,
    Emitter<IOrderListState> emit,
  ) async {
    final requestVersion = ++_requestVersion;
    emit(const OrderListLoading());
    resetPagination();

    try {
      final result = await _getOrderList(event.entity.copyWith(page: 1));
      if (requestVersion != _requestVersion) return;

      result.fold(
        (failure) => emit(OrderListFailed(failure.message)),
        (response) {
          final model = response?.data;
          final page = model?.pagination;

          replacePage(page);

          emit(
            OrderListLoaded(
              orderList: _withAccumulatedItems(model),
            ),
          );
        },
      );
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (requestVersion != _requestVersion) return;
      emit(OrderListFailed(error.toString()));
    }
  }

  FutureOr<void> _loadMore(
    LoadMoreOrderListEvent event,
    Emitter<IOrderListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! OrderListLoaded ||
        isLoadingMore ||
        !canLoadMore) {
      return;
    }

    setLoadingMore(true);
    final requestVersion = _requestVersion;

    try {
      final result = await _getOrderList(
        event.entity.copyWith(page: nextPage),
      );
      if (requestVersion != _requestVersion) return;

      result.fold(
        (failure) => log(failure.message),
        (response) {
          final model = response?.data;
          final page = model?.pagination;

          appendPage(page);

          emit(
            OrderListLoaded(
              orderList: _withAccumulatedItems(
                model ?? currentState.orderList,
              ),
            ),
          );
        },
      );
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (requestVersion != _requestVersion) return;
    } finally {
      setLoadingMore(false);
    }
  }

  OrderListModel? _withAccumulatedItems(OrderListModel? model) {
    if (model == null) return null;

    return model.copyWith(
      pagination: model.pagination.copyWith(items: items),
    );
  }
}
