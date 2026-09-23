import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/service_type/service_type_model.dart';

abstract interface class IServiceTypeRepository {
  Future<Either<AppException, BaseModel<List<ServiceTypeModel>>?>>
  getServiceTypes();
}
