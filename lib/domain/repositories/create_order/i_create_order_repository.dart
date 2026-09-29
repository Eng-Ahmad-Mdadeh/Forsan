import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/create_order/create_order_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';


abstract interface class ICreateOrderRepository {
  Future<Either<AppException, BaseModel<CreateOrderModel>?>> createOrder(CreateOrderEntity data);
  Future<Either<AppException, BaseModel<CreateOrderModel>?>> completeOrder(CreateOrderEntity data);
}
