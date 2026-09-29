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
  UploadFileBloc({
    IUseCase<BaseModel<FileModel>?, CreateOrderEntity>? uploadFile,
  }) : _uploadFile =
           uploadFile ??
           locator<IUseCase<BaseModel<FileModel>?, CreateOrderEntity>>(
             instanceName: 'uploadFile',
           ),
       super(const UploadFileInitial()) {
    on<UploadFileEvent>(_uploadFiles);
  }

  final IUseCase<BaseModel<FileModel>?, CreateOrderEntity> _uploadFile;

  FutureOr<FileModel> _uploadFiles(
    UploadFileEvent event,
    Emitter<IUploadFileState> emit,
  ) async {
    emit(UploadFileLoading(requirementId: event.requirementId));

    try {
      final result = await _uploadFile(event.entity);
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
      log(error.toString(), stackTrace: stackTrace);
      emit(
        UploadFileFailed(
          error.toString(),
          requirementId: event.requirementId,
        ),
      );
    }
  }
}
