import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/data/data_sources/order_steps/order_steps_remote_data_source.dart';
import 'package:forsan/domain/repositories/order_steps/i_order_steps_repository.dart';
import 'package:forsan/domain/entities/order_steps/order_steps_entity.dart';



@Injectable(as: IOrderStepsRepository)
class OrderStepsRepository implements IOrderStepsRepository{
  final OrderStepsRemoteDataSource _remoteDataSource;

  OrderStepsRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<OrderStepsModel>?>> getOrderSteps(
      OrderStepsEntity entity,
      ) async {
    final response = await _remoteDataSource.getOrderSteps(entity);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
}