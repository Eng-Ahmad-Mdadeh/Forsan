import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'confirm_file_event.dart';
part 'confirm_file_state.dart';

class ConfirmFileBloc extends Bloc<IConfirmFileEvent, IConfirmFileState> {
  ConfirmFileBloc() : super(const ConfirmFileInitial()) {
    on<ConfirmFileEvent>(_confirmFile);
  }

  FutureOr<void> _confirmFile(
    ConfirmFileEvent event,
    Emitter<IConfirmFileState> emit,
  ) async {
    emit(ConfirmFileLoading());

    try {
      final result =
          await locator<IUseCase<BaseModel<void>?, CreateOrderEntity>>(
            instanceName: 'confirmFile',
          )(event.entity);
      result.fold(
        (failure) => emit(
          ConfirmFileFailed(
            failure.message,

          ),
        ),
        (response) => emit(
          ConfirmFileLoaded(
            response: response,

          ),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(
        ConfirmFileFailed(
          error.toString(),

        ),
      );
    }
  }
}
