import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:forsan/domain/entities/order_details/order_details_entity.dart';


@Injectable()
class OrderDetailsRemoteDataSource extends BaseRemoteDataSource<OrderDetailsModel> {
  OrderDetailsRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<OrderDetailsModel>?>> getOrderDetails(OrderDetailsEntity entity) {
    final requestIdentifier = entity.requestIdentifier;
    if (requestIdentifier == null) {
      return Future.value(Left(AppException('A request ID or reference is required')));
    }

    return fetchData(
      endpoint: ApiEndpoints.orderDetails(requestIdentifier),
      dataMayBeAtRoot: true,
      fromJsonT: (json) => OrderDetailsModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
