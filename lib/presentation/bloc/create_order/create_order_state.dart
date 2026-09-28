part of 'create_order_bloc.dart';

sealed class ICreateOrderState extends Equatable {
  const ICreateOrderState();
}

final class CreateOrderInitial extends ICreateOrderState {
  @override
  List<Object?> get props => [];
}

final class CreateOrderLoading extends ICreateOrderState {
  @override
  List<Object?> get props => [];
}

final class CreateOrderLoaded extends ICreateOrderState {
  const CreateOrderLoaded({required this.createOrderModel});

  final BaseModel<CreateOrderModel>? createOrderModel;

  @override
  List<Object?> get props => [createOrderModel];
}

final class CreateOrderFailed extends ICreateOrderState {
  const CreateOrderFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
