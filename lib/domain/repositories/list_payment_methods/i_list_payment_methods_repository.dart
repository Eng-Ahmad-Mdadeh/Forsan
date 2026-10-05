import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/list_payment_methods/list_payment_methods_model.dart';

abstract interface class IListPaymentMethodsRepository {
  Future<Either<AppException, BaseModel<List<ListPaymentMethodsModel>>?>> getListPaymentMethods();
}
