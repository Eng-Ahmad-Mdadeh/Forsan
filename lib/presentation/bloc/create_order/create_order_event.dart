part of 'create_order_bloc.dart';

sealed class ICreateOrderEvent extends Equatable {
  const ICreateOrderEvent();
}

final class CreateOrderEvent extends ICreateOrderEvent {
  const CreateOrderEvent(this.entity);

  final CreateOrderEntity entity;

  @override
  List<Object?> get props => [entity];
}
