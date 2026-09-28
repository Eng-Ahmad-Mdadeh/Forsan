import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/create_order/create_order_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<ICreateOrderEvent, ICreateOrderState> {
  CreateOrderBloc() : super(CreateOrderInitial()) {
    on<CreateOrderEvent>(_createOrder);
  }

  FutureOr<void> _createOrder(
    CreateOrderEvent event,
    Emitter<ICreateOrderState> emit,
  ) async {
    emit(CreateOrderLoading());
    try {
      final result =
          await locator<
            IUseCase<BaseModel<CreateOrderModel>?, CreateOrderEntity>
          >(instanceName: 'CreateOrder')(event.entity);
      result.fold(
        (failure) => emit(CreateOrderFailed(failure.message)),
        (order) => emit(CreateOrderLoaded(createOrderModel: order)),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(CreateOrderFailed(error.toString()));
    }
  }
}
