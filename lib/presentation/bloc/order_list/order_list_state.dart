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
  });

  final OrderListModel? orderList;

  List<Item> get items => orderList?.pagination.items ?? const [];

  @override
  List<Object?> get props => [orderList];
}

final class OrderListFailed extends IOrderListState {
  const OrderListFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
