part of 'complete_order_bloc.dart';

sealed class ICompleteOrderState extends Equatable {
  const ICompleteOrderState();
}

final class CompleteOrderInitial extends ICompleteOrderState {
  @override
  List<Object?> get props => [];
}

final class CompleteOrderLoading extends ICompleteOrderState {
  @override
  List<Object?> get props => [];
}

final class CompleteOrderLoaded extends ICompleteOrderState {
  const CompleteOrderLoaded({required this.completeOrderModel});

  final BaseModel<CreateOrderModel>? completeOrderModel;

  @override
  List<Object?> get props => [completeOrderModel];
}

final class CompleteOrderFailed extends ICompleteOrderState {
  const CompleteOrderFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
