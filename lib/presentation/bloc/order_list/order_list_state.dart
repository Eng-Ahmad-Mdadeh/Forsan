part of 'order_list_bloc.dart';

sealed class IOrderListState extends Equatable {
  const IOrderListState();
}

final class OrderListInitial extends IOrderListState {
  const OrderListInitial();

  @override
  List<Object?> get props => [];
}

final class OrderListLoading extends IOrderListState {
  const OrderListLoading();

  @override
  List<Object?> get props => [];
}

final class OrderListLoaded extends IOrderListState {
  const OrderListLoaded({
    required this.orderList,
    required this.hasMore,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  final OrderListModel? orderList;
  final bool hasMore;
  final bool isLoadingMore;
  final String? loadMoreError;

  List<Item> get items => orderList?.pagination.items ?? const [];

  OrderListLoaded copyWith({
    OrderListModel? orderList,
    bool? hasMore,
    bool? isLoadingMore,
    String? loadMoreError,
    bool clearLoadMoreError = false,
  }) {
    return OrderListLoaded(
      orderList: orderList ?? this.orderList,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? false,
      loadMoreError: clearLoadMoreError
          ? null
          : loadMoreError ?? this.loadMoreError,
    );
  }

  @override
  List<Object?> get props => [
    orderList,
    hasMore,
    isLoadingMore,
    loadMoreError,
  ];
}

final class OrderListFailed extends IOrderListState {
  const OrderListFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
