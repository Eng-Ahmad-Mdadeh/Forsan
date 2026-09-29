import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/file/file_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'upload_file_event.dart';
part 'upload_file_state.dart';

class UploadFileBloc extends Bloc<IUploadFileEvent, IUploadFileState> {
  UploadFileBloc() : super(UploadFileInitial()) {
    on<UploadFileEvent>(_uploadFiles);
  }

  FutureOr<void> _uploadFiles(
    UploadFileEvent event,
    Emitter<IUploadFileState> emit,
  ) async {
    emit(UploadFileLoading(requirementId: event.requirementId));

    try {
      final result =
          await locator<IUseCase<BaseModel<FileModel>?, CreateOrderEntity>>(
            instanceName: 'uploadFile',
          )(event.entity);
      result.fold(
        (failure) => emit(
          UploadFileFailed(
            failure.message,
            requirementId: event.requirementId,
          ),
        ),
        (response) => emit(
          UploadFileLoaded(
            response: response,
            requirementId: event.requirementId,
          ),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(
        UploadFileFailed(
          error.toString(),
          requirementId: event.requirementId,
        ),
      );
    }
  }
}
