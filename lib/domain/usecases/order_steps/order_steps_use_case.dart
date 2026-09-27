import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/repositories/order_steps/i_order_steps_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUseCase<BaseModel<OrderStepsModel>?, CreateOrderEntity>)
@Named('OrderSteps')
class OrderStepsUseCase implements IUseCase<BaseModel<OrderStepsModel>?, CreateOrderEntity> {
  const OrderStepsUseCase(this._repository);

  final IOrderStepsRepository _repository;

  @override
  Future<Either<AppException, BaseModel<OrderStepsModel>?>> call(
      CreateOrderEntity params,
      ) {
    return _repository.getOrderSteps(params);
  }
}
