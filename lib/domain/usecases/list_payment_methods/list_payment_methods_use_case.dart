import 'package:forsan/data/models/home/home_model.dart';
import 'package:forsan/data/models/list_payment_methods/list_payment_methods_model.dart';
import 'package:forsan/domain/repositories/home/i_home_repository.dart';
import 'package:forsan/domain/repositories/list_payment_methods/i_list_payment_methods_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/data/models/base/base_model.dart';
import '../../../core/exceptions/app_exception.dart';

@Injectable(as: IUseCase<BaseModel<ListPaymentMethodsModel>?, Null>)
@Named('ListPaymentMethods')
class ListPaymentMethodsUseCase implements IUseCase<BaseModel<ListPaymentMethodsModel>?, Null> {
  final IListPaymentMethodsRepository _repository;

  ListPaymentMethodsUseCase(this._repository);

  @override
  Future<Either<AppException, BaseModel<ListPaymentMethodsModel>?>> call(Null n) {
    return _repository.getListPaymentMethods();
  }
}
