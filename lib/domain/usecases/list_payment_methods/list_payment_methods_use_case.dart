import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/list_payment_methods/list_payment_methods_model.dart';
import 'package:forsan/domain/repositories/list_payment_methods/i_list_payment_methods_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUseCase<BaseModel<List<ListPaymentMethodsModel>>?, Null>)
@Named('ListPaymentMethods')
class ListPaymentMethodsUseCase
    implements IUseCase<BaseModel<List<ListPaymentMethodsModel>>?, Null> {
  final IListPaymentMethodsRepository _repository;

  ListPaymentMethodsUseCase(this._repository);

  @override
  Future<Either<AppException, BaseModel<List<ListPaymentMethodsModel>>?>> call(
    Null n,
  ) {
    return _repository.getListPaymentMethods();
  }
}
