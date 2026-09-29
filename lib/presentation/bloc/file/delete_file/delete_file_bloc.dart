import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'delete_file_event.dart';
part 'delete_file_state.dart';

class DeleteFileBloc extends Bloc<IDeleteFileEvent, IDeleteFileState> {
  DeleteFileBloc() : super(const DeleteFileInitial()) {
    on<DeleteFileEvent>(_deleteFiles);
  }

  FutureOr<void> _deleteFiles(
    DeleteFileEvent event,
    Emitter<IDeleteFileState> emit,
  ) async {
    emit(DeleteFileLoading(requirementId: event.requirementId));

    try {
      final result =
          await locator<IUseCase<BaseModel<void>?, CreateOrderEntity>>(
            instanceName: 'deleteFile',
          )(event.entity);
      result.fold(
        (failure) => emit(
          DeleteFileFailed(
            failure.message,
            requirementId: event.requirementId,
          ),
        ),
        (response) => emit(
          DeleteFileLoaded(
            response: response,
            requirementId: event.requirementId,
          ),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(
        DeleteFileFailed(
          error.toString(),
          requirementId: event.requirementId,
        ),
      );
    }
  }
}
