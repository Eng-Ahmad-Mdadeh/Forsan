import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'delete_order_event.dart';
part 'delete_order_state.dart';

class DeleteOrderBloc extends Bloc<IDeleteOrderEvent, IDeleteOrderState> {
  DeleteOrderBloc() : super(const DeleteOrderInitial()) {
    on<DeleteOrderEvent>(_deleteOrder);
  }

  FutureOr<void> _deleteOrder(
    DeleteOrderEvent event,
    Emitter<IDeleteOrderState> emit,
  ) async {
    emit(const DeleteOrderLoading());

    try {
      final result =
          await locator<IUseCase<BaseModel<void>?, CreateOrderEntity>>(
            instanceName: 'deleteOrder',
          )(event.entity);

      result.fold(
        (failure) => emit(DeleteOrderFailed(failure.message)),
        (response) => emit(DeleteOrderLoaded(response: response)),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(DeleteOrderFailed(error.toString()));
    }
  }
}
