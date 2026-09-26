import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_details/order_details_model.dart';
import 'package:forsan/domain/entities/order_details/order_details_entity.dart';
import 'package:forsan/domain/repositories/order_details/i_order_details_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart' show Injectable, Named;

@Injectable(as: IUseCase<BaseModel<OrderDetailsModel>?, OrderDetailsEntity>)
@Named('OrderDetails')
class OrderDetailsUseCase implements IUseCase<BaseModel<OrderDetailsModel>?, OrderDetailsEntity> {
  const OrderDetailsUseCase(this._repository);

  final IOrderDetailsRepository _repository;

  @override
  Future<Either<AppException, BaseModel<OrderDetailsModel>?>> call(
      OrderDetailsEntity params,
      ) {
    return _repository.getOrderDetails(params);
  }
}
