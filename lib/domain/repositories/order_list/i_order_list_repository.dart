import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';

abstract interface class IOrderListRepository {
  Future<Either<AppException, BaseModel<OrderListModel>?>> getOrderList();
}
