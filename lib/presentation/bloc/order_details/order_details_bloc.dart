import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:forsan/domain/entities/order_details/order_details_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';

class OrderDetailsBloc extends Bloc<IOrderDetailsEvent, IOrderDetailsState> {
  OrderDetailsBloc() : super(OrderDetailsInitial()) {
    on<OrderDetailsEvent>(_getOrderDetails);
  }

  FutureOr<void> _getOrderDetails(
    OrderDetailsEvent event,
    Emitter<IOrderDetailsState> emit,
  ) async {
    emit(OrderDetailsLoading());
    try {
      final result =
          await locator<
            IUseCase<BaseModel<OrderDetailsModel>?, OrderDetailsEntity>
          >(instanceName: 'OrderDetails')(event.entity);
      result.fold(
        (failure) => emit(OrderDetailsFailed(failure.message)),
        (orderDetails) => emit(
          OrderDetailsLoaded(orderDetailsModel: orderDetails),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(OrderDetailsFailed(error.toString()));
    }
  }
}
