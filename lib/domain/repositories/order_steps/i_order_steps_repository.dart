import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_steps/order_steps_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class IOrderStepsRepository {
  Future<Either<AppException, BaseModel<OrderStepsModel>?>> getOrderSteps(
      CreateOrderEntity entity,
  );
}
