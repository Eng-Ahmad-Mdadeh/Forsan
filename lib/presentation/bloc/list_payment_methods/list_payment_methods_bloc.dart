import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/list_payment_methods/list_payment_methods_model.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'list_payment_methods_event.dart';
part 'list_payment_methods_state.dart';

class ListPaymentMethodsBloc
    extends Bloc<IListPaymentMethodsEvent, IListPaymentMethodsState> {
  ListPaymentMethodsBloc() : super(ListPaymentMethodsInitial()) {
    on<ListPaymentMethodsEvent>(_getListPaymentMethods);
  }

  FutureOr<void> _getListPaymentMethods(
    ListPaymentMethodsEvent event,
    Emitter<IListPaymentMethodsState> emit,
  ) async {
    emit(ListPaymentMethodsLoading());
    try {
      final result =
          await locator<
            IUseCase<BaseModel<List<ListPaymentMethodsModel>>?, Null>
          >(instanceName: 'ListPaymentMethods')(null);
      result.fold(
        (failure) => emit(ListPaymentMethodsFailed(failure.message)),
        (paymentMethods) => emit(
          ListPaymentMethodsLoaded(listPaymentMethodsModel: paymentMethods),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(ListPaymentMethodsFailed(error.toString()));
    }
  }
}
