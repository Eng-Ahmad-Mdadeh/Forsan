import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/order_list/order_list_model.dart';
import 'package:forsan/data/data_sources/order_list/order_list_remote_data_source.dart';
import 'package:forsan/domain/repositories/order_list/i_order_list_repository.dart';

@Injectable(as: IOrderListRepository)
class OrderListRepository implements IOrderListRepository{
  final OrderListRemoteDataSource _remoteDataSource;

  OrderListRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<OrderListModel>?>> getOrderList() async {
    final response = await _remoteDataSource.getOrderList();
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
}