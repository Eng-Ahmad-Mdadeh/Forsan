import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/create_order/create_order_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'submit_order_event.dart';
part 'submit_order_state.dart';

class SubmitOrderBloc extends Bloc<ISubmitOrderEvent, ISubmitOrderState> {
  SubmitOrderBloc() : super(SubmitOrderInitial()) {
    on<SubmitOrderEvent>(_submitOrder);
  }

  FutureOr<void> _submitOrder(
    SubmitOrderEvent event,
    Emitter<ISubmitOrderState> emit,
  ) async {
    emit(SubmitOrderLoading());
    try {
      final result =
          await locator<
            IUseCase<BaseModel<CreateOrderModel>?, CreateOrderEntity>
          >(instanceName: 'SubmitOrder')(event.entity);
      result.fold(
        (failure) => emit(SubmitOrderFailed(failure.message)),
        (order) => emit(SubmitOrderLoaded(submitOrderModel: order)),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(SubmitOrderFailed(error.toString()));
    }
  }
}
