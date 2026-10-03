import 'package:dartz/dartz.dart';
import 'dart:typed_data';
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
    final itemId = data.requiredDocumentItemId;
    final isRequiredDocument = itemId?.isNotEmpty == true;

    for (final entry in data.requirementDocuments.entries) {
      final path = entry.value.path;
      if (path == null) continue;

      result = await postData(
        // endpoint: ApiEndpoints.uploadFile(data.orderId!),
        // data: {'fieldId': entry.key},
        endpoint: ApiEndpoints.uploadFile(
          data.orderId!,
          itemId: isRequiredDocument ? itemId : null,
        ),
        data: isRequiredDocument ? null : {'fieldId': entry.key},
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

  Future<Either<AppException, BaseModel<void>?>> confirmFile(
      CreateOrderEntity data,
      ) {
    return postData(
      endpoint: ApiEndpoints.confirmFile(data.orderId!),
      isFormData: false,
      dataMayBeAtRoot: true,
    );
  }

  Future<Either<AppException, BaseModel<void>?>> deleteFile(
      CreateOrderEntity data,
      ) {
    return deleteData(
      endpoint: ApiEndpoints.deleteFile(data.orderId!, data.fileId!),
    );
  }

  Future<Either<AppException, Uint8List>> downloadFile(
      CreateOrderEntity data,
      ) {
    return downloadData(
      endpoint: ApiEndpoints.downloadFile(data.fileId!),
    );
  }

}
