part of 'list_payment_methods_bloc.dart';

sealed class IListPaymentMethodsState extends Equatable {
  const IListPaymentMethodsState();
}

final class ListPaymentMethodsInitial extends IListPaymentMethodsState {
  @override
  List<Object?> get props => [];
}

final class ListPaymentMethodsLoading extends IListPaymentMethodsState {
  @override
  List<Object?> get props => [];
}

final class ListPaymentMethodsLoaded extends IListPaymentMethodsState {
  const ListPaymentMethodsLoaded({required this.listPaymentMethodsModel});

  final BaseModel<List<ListPaymentMethodsModel>>? listPaymentMethodsModel;

  @override
  List<Object?> get props => [listPaymentMethodsModel];
}

final class ListPaymentMethodsFailed extends IListPaymentMethodsState {
  const ListPaymentMethodsFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
