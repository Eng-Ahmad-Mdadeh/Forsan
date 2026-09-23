import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/service_type/service_type_model.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';

@Injectable()
class ServiceTypeRemoteDataSource
    extends BaseRemoteDataSource<List<ServiceTypeModel>> {
  ServiceTypeRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<List<ServiceTypeModel>>?>>
  getServiceTypes() {
    return fetchData(
      endpoint: ApiEndpoints.serviceType,
      fromJsonT: (json) => (json as List<dynamic>)
          .map(
            (serviceType) => ServiceTypeModel.fromJson(
              serviceType as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }
}
