part of 'order_steps_bloc.dart';

sealed class IOrderStepsState extends Equatable {
  const IOrderStepsState();
}

final class OrderStepsInitial extends IOrderStepsState {
  @override
  List<Object?> get props => [];
}

final class OrderStepsLoading extends IOrderStepsState {
  @override
  List<Object?> get props => [];
}

final class OrderStepsLoaded extends IOrderStepsState {
  const OrderStepsLoaded({required this.orderStepsModel});

  final BaseModel<OrderStepsModel>? orderStepsModel;

  @override
  List<Object?> get props => [orderStepsModel];
}

final class OrderStepsFailed extends IOrderStepsState {
  const OrderStepsFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
