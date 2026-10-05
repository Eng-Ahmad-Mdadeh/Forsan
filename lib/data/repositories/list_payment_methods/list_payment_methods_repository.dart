import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/list_payment_methods/list_payment_methods_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/list_payment_methods/list_payment_methods_model.dart';
import 'package:forsan/domain/repositories/list_payment_methods/i_list_payment_methods_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IListPaymentMethodsRepository)
class ListPaymentMethodsRepository implements IListPaymentMethodsRepository {
  final ListPaymentMethodsRemoteDataSource _remoteDataSource;

  ListPaymentMethodsRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<List<ListPaymentMethodsModel>>?>>
  getListPaymentMethods() async {
    final response = await _remoteDataSource.getListPaymentMethods();
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
}
