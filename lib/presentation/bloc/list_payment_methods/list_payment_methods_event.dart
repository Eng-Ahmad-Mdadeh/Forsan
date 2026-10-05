part of 'list_payment_methods_bloc.dart';

sealed class IListPaymentMethodsEvent extends Equatable {
  const IListPaymentMethodsEvent();
}

final class ListPaymentMethodsEvent extends IListPaymentMethodsEvent {
  const ListPaymentMethodsEvent();

  @override
  List<Object?> get props => [];
}
