import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/domain/entities/order_steps/order_steps_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'order_steps_event.dart';
part 'order_steps_state.dart';

class OrderStepsBloc extends Bloc<IOrderStepsEvent, IOrderStepsState> {
  OrderStepsBloc() : super(OrderStepsInitial()) {
    on<OrderStepsEvent>(_getOrderSteps);
  }

  FutureOr<void> _getOrderSteps(
    OrderStepsEvent event,
    Emitter<IOrderStepsState> emit,
  ) async {
    emit(OrderStepsLoading());
    try {
      final result =
          await locator<
            IUseCase<BaseModel<OrderStepsModel>?, OrderStepsEntity>
          >(instanceName: 'OrderSteps')(event.entity);
      result.fold(
        (failure) => emit(OrderStepsFailed(failure.message)),
        (orderSteps) => emit(
          OrderStepsLoaded(orderStepsModel: orderSteps),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(OrderStepsFailed(error.toString()));
    }
  }
}
