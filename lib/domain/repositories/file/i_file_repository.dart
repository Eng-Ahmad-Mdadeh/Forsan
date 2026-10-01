import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/file/file_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';


abstract interface class IFileRepository {
  Future<Either<AppException, BaseModel<FileModel>?>> uploadFile(CreateOrderEntity data);
  Future<Either<AppException, BaseModel<void>?>> deleteFile(CreateOrderEntity data);
  Future<Either<AppException, Uint8List>> downloadFile(CreateOrderEntity data);
}
