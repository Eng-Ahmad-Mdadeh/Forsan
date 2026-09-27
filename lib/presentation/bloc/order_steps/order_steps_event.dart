part of 'order_steps_bloc.dart';

sealed class IOrderStepsEvent extends Equatable {
  const IOrderStepsEvent();
}

final class OrderStepsEvent extends IOrderStepsEvent {
  const OrderStepsEvent(this.entity);

  final CreateOrderEntity entity;

  @override
  List<Object?> get props => [entity];
}
