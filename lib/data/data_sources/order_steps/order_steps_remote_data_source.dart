import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:dartz/dartz.dart';

@Injectable()
class OrderStepsRemoteDataSource extends BaseRemoteDataSource<OrderStepsModel> {
  OrderStepsRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<OrderStepsModel>?>> getOrderSteps(CreateOrderEntity entity) {
    return fetchData(
      endpoint: ApiEndpoints.orderSteps(entity.slug!),
      dataMayBeAtRoot: true,
      fromJsonT: (json) => OrderStepsModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
