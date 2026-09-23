import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/utils/pagination/page_pagination_controller.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'order_list_event.dart';
part 'order_list_state.dart';

class OrderListBloc extends Bloc<IOrderListEvent, IOrderListState> {
  OrderListBloc(this._getOrderList) : super(const OrderListInitial()) {
    on<GetOrderListEvent>(_getOrders);
    on<LoadMoreOrderListEvent>(_loadMore);
  }

  final IUseCase<BaseModel<OrderListModel>?, OrderListEntity> _getOrderList;

  final PagePaginationController<Item, String> _pagination =
      PagePaginationController<Item, String>(identifier: (item) => item.id);
  int _requestVersion = 0;

  FutureOr<void> _getOrders(
    GetOrderListEvent event,
    Emitter<IOrderListState> emit,
  ) async {
    final requestVersion = ++_requestVersion;
    emit(const OrderListLoading());
    _pagination.reset();

    try {
      final result = await _getOrderList(event.entity.copyWith(page: 1));
      if (requestVersion != _requestVersion) return;

      result.fold(
        (failure) => emit(OrderListFailed(failure.message)),
        (response) {
          final model = response?.data;
          final page = model?.pagination;

          _pagination.replaceWith(
            items: page?.items,
            page: page?.page,
            pageSize: page?.pageSize,
            total: page?.total,
          );

          emit(
            OrderListLoaded(
              orderList: _withAccumulatedItems(model),
              hasMore: _pagination.hasMore,
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
        currentState.isLoadingMore ||
        !_pagination.hasMore) {
      return;
    }

    emit(currentState.copyWith(isLoadingMore: true, clearLoadMoreError: true));
    final requestVersion = _requestVersion;

    try {
      final result = await _getOrderList(
        event.entity.copyWith(page: _pagination.nextPage),
      );
      if (requestVersion != _requestVersion) return;

      result.fold(
        (failure) => emit(
          currentState.copyWith(
            loadMoreError: failure.message,
            clearLoadMoreError: false,
          ),
        ),
        (response) {
          final model = response?.data;
          final page = model?.pagination;

          _pagination.append(
            items: page?.items,
            page: page?.page,
            pageSize: page?.pageSize,
            total: page?.total,
          );

          emit(
            OrderListLoaded(
              orderList: _withAccumulatedItems(
                model ?? currentState.orderList,
              ),
              hasMore: _pagination.hasMore,
            ),
          );
        },
      );
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (requestVersion != _requestVersion) return;
      emit(
        currentState.copyWith(
          loadMoreError: error.toString(),
          clearLoadMoreError: false,
        ),
      );
    }
  }

  OrderListModel? _withAccumulatedItems(OrderListModel? model) {
    if (model == null) return null;

    return model.copyWith(
      pagination: model.pagination.copyWith(items: _pagination.items),
    );
  }
}
