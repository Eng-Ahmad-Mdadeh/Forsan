import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/services/locator/locator.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';

part 'download_file_event.dart';
part 'download_file_state.dart';

class DownloadFileBloc extends Bloc<IDownloadFileEvent, IDownloadFileState> {
  DownloadFileBloc() : super(const DownloadFileInitial()) {
    on<DownloadFileEvent>(_downloadFile);
  }

  FutureOr<void> _downloadFile(
      DownloadFileEvent event,
      Emitter<IDownloadFileState> emit,
      ) async {
    emit(DownloadFileLoading(fileId: event.fileId));

    try {
      final result = await locator<IUseCase<Uint8List, CreateOrderEntity>>(
        instanceName: 'downloadFile',
      )(event.entity);
      result.fold(
            (failure) => emit(
          DownloadFileFailed(
            failure.message,
            fileId: event.fileId,
          ),
        ),
            (response) => emit(
          DownloadFileLoaded(
            response: response,
            fileId: event.fileId,
          ),
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());
      emit(
        DownloadFileFailed(
          error.toString(),
          fileId: event.fileId,
        ),
      );
    }
  }
}