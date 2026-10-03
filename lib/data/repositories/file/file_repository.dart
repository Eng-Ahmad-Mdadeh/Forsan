import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/file/file_model.dart';
import 'package:forsan/data/data_sources/file/file_remote_data_source.dart';
import 'package:forsan/domain/repositories/file/i_file_repository.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';

@Injectable(as: IFileRepository)
class FileRepository implements IFileRepository {
  final FileRemoteDataSource _remoteDataSource;

  FileRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<FileModel>?>> uploadFile(CreateOrderEntity data) async {
    final response = await _remoteDataSource.uploadFile(data);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }


  @override
  Future<Either<AppException, BaseModel<void>?>> deleteFile(CreateOrderEntity data) async {
    final response = await _remoteDataSource.deleteFile(data);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
  @override
  Future<Either<AppException, Uint8List>> downloadFile(CreateOrderEntity data) async {
    final response = await _remoteDataSource.downloadFile(data);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }

  @override
  Future<Either<AppException, BaseModel<void>?>> confirmFile(CreateOrderEntity data) async {
    final response = await _remoteDataSource.confirmFile(data);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
}
