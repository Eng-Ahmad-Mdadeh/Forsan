part of 'order_details_bloc.dart';

sealed class IOrderDetailsState extends Equatable {
  const IOrderDetailsState();
}

final class OrderDetailsInitial extends IOrderDetailsState {
  @override
  List<Object?> get props => [];
}

final class OrderDetailsLoading extends IOrderDetailsState {
  @override
  List<Object?> get props => [];
}

final class OrderDetailsLoaded extends IOrderDetailsState {
  const OrderDetailsLoaded({required this.orderDetailsModel});

  final BaseModel<OrderDetailsModel>? orderDetailsModel;

  @override
  List<Object?> get props => [orderDetailsModel];
}

final class OrderDetailsFailed extends IOrderDetailsState {
  const OrderDetailsFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
