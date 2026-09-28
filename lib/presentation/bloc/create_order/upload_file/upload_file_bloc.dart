import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'upload_file_event.dart';
part 'upload_file_state.dart';

class UploadFileBloc extends Bloc<IUploadFileEvent, IUploadFileState> {
  UploadFileBloc({
    IUseCase<BaseModel<void>?, CreateOrderEntity>? uploadFile,
  }) : _uploadFile =
           uploadFile ??
           locator<IUseCase<BaseModel<void>?, CreateOrderEntity>>(
             instanceName: 'uploadFile',
           ),
       super(const UploadFileInitial()) {
    on<UploadFileEvent>(_uploadFiles);
  }

  final IUseCase<BaseModel<void>?, CreateOrderEntity> _uploadFile;

  FutureOr<void> _uploadFiles(
    UploadFileEvent event,
    Emitter<IUploadFileState> emit,
  ) async {
    emit(const UploadFileLoading());

    try {
      final result = await _uploadFile(event.entity);
      result.fold(
        (failure) => emit(UploadFileFailed(failure.message)),
        (response) => emit(UploadFileLoaded(response: response)),
      );
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      emit(UploadFileFailed(error.toString()));
    }
  }
}
