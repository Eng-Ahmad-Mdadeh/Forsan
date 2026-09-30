part of 'delete_order_bloc.dart';

sealed class IDeleteOrderState extends Equatable {
  const IDeleteOrderState();
}

final class DeleteOrderInitial extends IDeleteOrderState {
  const DeleteOrderInitial();

  @override
  List<Object?> get props => [];
}

final class DeleteOrderLoading extends IDeleteOrderState {
  const DeleteOrderLoading();

  @override
  List<Object?> get props => [];
}

final class DeleteOrderLoaded extends IDeleteOrderState {
  const DeleteOrderLoaded({required this.response});

  final BaseModel<void>? response;

  @override
  List<Object?> get props => [response];
}

final class DeleteOrderFailed extends IDeleteOrderState {
  const DeleteOrderFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
