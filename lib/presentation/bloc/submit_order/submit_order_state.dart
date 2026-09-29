part of 'submit_order_bloc.dart';

sealed class ISubmitOrderState extends Equatable {
  const ISubmitOrderState();
}

final class SubmitOrderInitial extends ISubmitOrderState {
  @override
  List<Object?> get props => [];
}

final class SubmitOrderLoading extends ISubmitOrderState {
  @override
  List<Object?> get props => [];
}

final class SubmitOrderLoaded extends ISubmitOrderState {
  const SubmitOrderLoaded({required this.submitOrderModel});

  final BaseModel<CreateOrderModel>? submitOrderModel;

  @override
  List<Object?> get props => [submitOrderModel];
}

final class SubmitOrderFailed extends ISubmitOrderState {
  const SubmitOrderFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
