import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/delete_order/delete_order_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/repositories/delete_order/i_delete_order_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IDeleteOrderRepository)
class DeleteOrderRepository implements IDeleteOrderRepository {
  final DeleteOrderRemoteDataSource _remoteDataSource;

  DeleteOrderRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<void>?>> deleteOrder(
    CreateOrderEntity data,
  ) {
    return _remoteDataSource.deleteOrder(data);
  }
}
