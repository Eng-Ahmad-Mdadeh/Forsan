import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:forsan/domain/entities/order_details/order_details_entity.dart';
import 'package:forsan/domain/repositories/order_details/i_order_details_repository.dart';
import 'package:forsan/data/data_sources/order_details/order_details_remote_data_source.dart';

@Injectable(as: IOrderDetailsRepository)
class OrderDetailsRepository implements IOrderDetailsRepository{
  final OrderDetailsRemoteDataSource _remoteDataSource;

  OrderDetailsRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<OrderDetailsModel>?>> getOrderDetails(OrderDetailsEntity data) async {
    final response = await _remoteDataSource.getOrderDetails(data);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
}