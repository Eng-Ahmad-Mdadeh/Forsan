import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/domain/entities/order_list/order_list_entity.dart';
import 'package:forsan/domain/repositories/order_list/i_order_list_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUseCase<BaseModel<OrderListModel>?, OrderListEntity>)
@Named('OrderList')
class OrderListUseCase
    implements IUseCase<BaseModel<OrderListModel>?, OrderListEntity> {
  const OrderListUseCase(this._repository);

  final IOrderListRepository _repository;

  @override
  Future<Either<AppException, BaseModel<OrderListModel>?>> call(
    OrderListEntity params,
  ) {
    return _repository.getOrderList(params);
  }
}
