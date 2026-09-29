part of 'complete_order_bloc.dart';

sealed class ICompleteOrderEvent extends Equatable {
  const ICompleteOrderEvent();
}

final class CompleteOrderEvent extends ICompleteOrderEvent {
  const CompleteOrderEvent(this.entity);

  final CreateOrderEntity entity;

  @override
  List<Object?> get props => [entity];
}
