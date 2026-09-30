import 'package:dartz/dartz.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class DocumentDetailsRemoteDataSource extends BaseRemoteDataSource<DocumentDetailsModel> {
  DocumentDetailsRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<DocumentDetailsModel>?>> getDocumentDetails(
      DocumentEntity entity,
      ) {
    return fetchData(
      endpoint: ApiEndpoints.documentDetails(entity.orderId!),
      dataMayBeAtRoot: true,
      fromJsonT: (json) =>
          DocumentDetailsModel.fromJson(json as Map<String, dynamic>),
    );
  }
}