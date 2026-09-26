import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';

import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:forsan/domain/entities/order_details/order_details_entity.dart';

abstract interface class IOrderDetailsRepository {
  Future<Either<AppException, BaseModel<OrderDetailsModel>?>> getOrderDetails(
    OrderDetailsEntity entity,
  );
}
