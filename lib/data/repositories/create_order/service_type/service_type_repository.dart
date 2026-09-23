import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/service_type/service_type_model.dart';
import 'package:forsan/data/data_sources/create_order/service_type/service_type_remote_data_source.dart';
import 'package:forsan/domain/repositories/create_order/service_type/i_service_type_repository.dart';

@Injectable(as: IServiceTypeRepository)
class ServiceTypeRepository implements IServiceTypeRepository {
  final ServiceTypeRemoteDataSource _remoteDataSource;

  ServiceTypeRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<List<ServiceTypeModel>>?>>
  getServiceTypes() async {
    final response = await _remoteDataSource.getServiceTypes();
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
}
