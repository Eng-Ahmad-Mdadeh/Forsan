part of 'order_list_bloc.dart';

sealed class IOrderListEvent extends Equatable {
  const IOrderListEvent();
}

final class GetOrderListEvent extends IOrderListEvent {
  const GetOrderListEvent(this.entity);

  final OrderListEntity entity;

  @override
  List<Object?> get props => [entity];
}

final class LoadMoreOrderListEvent extends IOrderListEvent {
  const LoadMoreOrderListEvent(this.entity);

  final OrderListEntity entity;

  @override
  List<Object?> get props => [entity];
}
