import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/create_order/create_order_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';

@Injectable()
class CreateOrderRemoteDataSource
    extends BaseRemoteDataSource<CreateOrderModel> {
  CreateOrderRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<CreateOrderModel>?>> createOrder(
    CreateOrderEntity data,
  ) {
    return postData(
      endpoint: ApiEndpoints.order,
      dataMayBeAtRoot: true,
      data: data.toJson(),
      fromJsonT: (json) =>
          CreateOrderModel.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<Either<AppException, BaseModel<void>?>> uploadFile(
    CreateOrderEntity data,
  ) {

    // final List<Map<String, dynamic>> files = data.requirementDocuments.entries
    //     .where((entry) => entry.value.path != null)
    //     .map((entry) => {'field_name': entry.key, 'path': entry.value.path!})
    //     .toList();

    return postData(
      endpoint: ApiEndpoints.uploadFile(data.orderId!),
      dataMayBeAtRoot: true,
      files: data.requirementDocuments,
    );
  }
}
