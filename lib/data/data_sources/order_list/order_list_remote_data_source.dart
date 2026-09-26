import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';



@Injectable()
class OrderListRemoteDataSource extends BaseRemoteDataSource<OrderListModel> {
  OrderListRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<OrderListModel>?>> getOrderList(
    OrderListEntity entity,
  ) {
    return fetchData(
      endpoint: ApiEndpoints.orderList,
      queryParams: entity.toJson(),
      dataMayBeAtRoot: true,
      fromJsonT: (json) => OrderListModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
