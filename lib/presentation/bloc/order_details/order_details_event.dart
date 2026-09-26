part of 'order_details_bloc.dart';

sealed class IOrderDetailsEvent extends Equatable {
  const IOrderDetailsEvent();
}

final class OrderDetailsEvent extends IOrderDetailsEvent {
  const OrderDetailsEvent(this.entity);

  final OrderDetailsEntity entity;

  @override
  List<Object?> get props => [entity];
}
