import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/create_order/create_order_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'complete_order_event.dart';
part 'complete_order_state.dart';

class CompleteOrderBloc extends Bloc<ICompleteOrderEvent, ICompleteOrderState> {
  CompleteOrderBloc() : super(CompleteOrderInitial()) {
    on<CompleteOrderEvent>(_completeOrder);
  }

  FutureOr<void> _completeOrder(
    CompleteOrderEvent event,
    Emitter<ICompleteOrderState> emit,
  ) async {
    emit(CompleteOrderLoading());
    try {
      final result =
          await locator<
            IUseCase<BaseModel<CreateOrderModel>?, CreateOrderEntity>
          >(instanceName: 'CompleteOrder')(event.entity);
      result.fold(
        (failure) => emit(CompleteOrderFailed(failure.message)),
        (order) => emit(CompleteOrderLoaded(completeOrderModel: order)),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(CompleteOrderFailed(error.toString()));
    }
  }
}
