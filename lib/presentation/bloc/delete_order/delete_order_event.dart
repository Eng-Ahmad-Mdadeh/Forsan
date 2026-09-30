part of 'delete_order_bloc.dart';

sealed class IDeleteOrderEvent extends Equatable {
  const IDeleteOrderEvent();
}

final class DeleteOrderEvent extends IDeleteOrderEvent {
  const DeleteOrderEvent(this.entity);

  final CreateOrderEntity entity;

  @override
  List<Object?> get props => [entity];
}
