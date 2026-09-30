import 'package:dartz/dartz.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_list/document_list_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DocumentListRemoteDataSource
    extends BaseRemoteDataSource<DocumentListModel> {
  DocumentListRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<DocumentListModel>?>> getDocumentList(
    DocumentEntity entity,
  ) {
    return fetchData(
      endpoint: ApiEndpoints.document,
      queryParams: entity.toJson(),
      dataMayBeAtRoot: true,
      fromJsonT: (json) =>
          DocumentListModel.fromJson(json as Map<String, dynamic>),
    );
  }
}
