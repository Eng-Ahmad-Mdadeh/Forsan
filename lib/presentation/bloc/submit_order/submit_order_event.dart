part of 'submit_order_bloc.dart';

sealed class ISubmitOrderEvent extends Equatable {
  const ISubmitOrderEvent();
}

final class SubmitOrderEvent extends ISubmitOrderEvent {
  const SubmitOrderEvent(this.entity);

  final CreateOrderEntity entity;

  @override
  List<Object?> get props => [entity];
}
