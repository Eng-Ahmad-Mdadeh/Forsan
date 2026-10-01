import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/repositories/file/i_file_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUseCase<Uint8List, CreateOrderEntity>)
@Named('downloadFile')
class DownloadFileUseCase implements IUseCase<Uint8List, CreateOrderEntity> {
  final IFileRepository _repository;

  DownloadFileUseCase(this._repository);

  @override
  Future<Either<AppException, Uint8List>> call(CreateOrderEntity data) {
    return _repository.downloadFile(data);
  }
}
