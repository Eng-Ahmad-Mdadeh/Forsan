import 'package:dartz/dartz.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/legal_page/legal_page_model.dart';
import 'package:forsan/domain/entities/legal_page/legal_page_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LegalPageRemoteDataSource extends BaseRemoteDataSource<LegalPageModel> {
  LegalPageRemoteDataSource() : super('');

  Future<Either<AppException, BaseModel<LegalPageModel>?>> getLegalPage(
    LegalPageEntity entity,
  ) {
    return fetchData(
      endpoint: ApiEndpoints.legalPage(entity.page!),
      dataMayBeAtRoot: true,
      fromJsonT: (json) =>
          LegalPageModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
