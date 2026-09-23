import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/service_type/service_type_model.dart';
import 'package:forsan/domain/repositories/create_order/service_type/i_service_type_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUseCase<BaseModel<ServiceTypeModel>?, Null>)
@Named('ServiceType')
class ServiceTypeUseCase implements IUseCase<BaseModel<ServiceTypeModel>?, Null> {
  final IServiceTypeRepository _repository;

  ServiceTypeUseCase(this._repository);

  @override
  Future<Either<AppException, BaseModel<ServiceTypeModel>?>> call(Null n) {
    return _repository.getServiceTypes();
  }
}
