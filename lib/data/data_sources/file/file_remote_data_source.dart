import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/file/file_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';

@Injectable()
class FileRemoteDataSource extends BaseRemoteDataSource<FileModel> {
  FileRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<FileModel>?>> uploadFile(
    CreateOrderEntity data,
  ) async {
    Either<AppException, BaseModel<FileModel>?> result = const Right(null);

    for (final entry in data.requirementDocuments.entries) {
      final path = entry.value.path;
      if (path == null) continue;

      result = await postData(
        endpoint: ApiEndpoints.uploadFile(data.orderId!),
        data: {'fieldId': entry.key},
        isFormData: true,
        dataMayBeAtRoot: true,
        fromJsonT: (json) => FileModel.fromJson(json as Map<String, dynamic>),
        files: [
          {'field_name': 'file', 'path': path},
        ],
      );

      if (result.isLeft()) return result;
    }

    return result;
  }

  Future<Either<AppException, BaseModel<void>?>> deleteFile(
      CreateOrderEntity data,
      ) async {

    for (final entry in data.requirementDocuments.entries) {
      final path = entry.value.path;
      if (path == null) continue;

      final result = await postData(
        endpoint: ApiEndpoints.deleteFile(data.orderId!, entry.key),
        isFormData: true,
        dataMayBeAtRoot: true,
      );

      if (result.isLeft()) return result;
    }

    return result;
  }
}
