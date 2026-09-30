import 'package:dartz/dartz.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DeleteOrderRemoteDataSource extends BaseRemoteDataSource<void> {
  DeleteOrderRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<void>?>> deleteOrder(
    CreateOrderEntity data,
  ) {
    return deleteData(endpoint: ApiEndpoints.orderDetails(data.orderId!));
  }
}
