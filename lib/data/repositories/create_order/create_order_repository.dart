import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/create_order/create_order_model.dart';
import 'package:forsan/data/data_sources/create_order/create_order_remote_data_source.dart';
import 'package:forsan/domain/repositories/create_order/i_create_order_repository.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';

@Injectable(as: ICreateOrderRepository)
class CreateOrderRepository implements ICreateOrderRepository {
  final CreateOrderRemoteDataSource _remoteDataSource;

  CreateOrderRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<CreateOrderModel>?>> createOrder(CreateOrderEntity data) async {
    final response = await _remoteDataSource.createOrder(data);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
  @override
  Future<Either<AppException, BaseModel<CreateOrderModel>?>> completeOrder(CreateOrderEntity data) async {
    final response = await _remoteDataSource.completeOrder(data);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }

}
