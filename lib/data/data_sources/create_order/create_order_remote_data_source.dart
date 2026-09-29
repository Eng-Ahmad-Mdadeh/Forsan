import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/create_order/create_order_model.dart';
import 'package:forsan/data/models/file/file_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';

@Injectable()
class CreateOrderRemoteDataSource
    extends BaseRemoteDataSource<CreateOrderModel> {
  CreateOrderRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<CreateOrderModel>?>> createOrder(
    CreateOrderEntity data,
  ) async {
    return postData(
      endpoint: ApiEndpoints.order,
      dataMayBeAtRoot: true,
      data: data.toJson(),
      fromJsonT: (json) =>
          CreateOrderModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<Either<AppException, BaseModel<FileModel>?>> uploadFile(
    CreateOrderEntity data,
  ) async {
    for (final entry in data.requirementDocuments.entries) {
      final path = entry.value.path;
      if (path == null) continue;

      final response = await postData(
        endpoint: ApiEndpoints.uploadFile(data.orderId!),
        data: {'fieldId': entry.key},
        isFormData: true,
        dataMayBeAtRoot: true,
        files: [
          {'field_name': 'file', 'path': path},
        ],
      );

      if (response.isLeft()) return response;
    }

    return const Right(null);
  }

  Future<Either<AppException, BaseModel<void>?>> deleteFile(
    CreateOrderEntity data,
  ) async {
    for (final entry in data.requirementDocuments.entries) {

      final response = await deleteData(
        endpoint: ApiEndpoints.deleteFile(data.orderId!, entry.key),
      );

      if (response.isLeft()) return response;
    }

    return const Right(null);
  }
}
