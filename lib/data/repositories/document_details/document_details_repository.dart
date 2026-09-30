import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/document_details/document_details_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:forsan/domain/repositories/document_details/i_document_details_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IDocumentDetailsRepository)
class DocumentDetailsRepository implements IDocumentDetailsRepository {
  final DocumentDetailsRemoteDataSource _remoteDataSource;

  DocumentDetailsRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<DocumentDetailsModel>?>>
  getDocumentDetails(DocumentEntity entity) async {
    final response = await _remoteDataSource.getDocumentDetails(entity);
    return response.fold(
      (failure) => Left(failure),
      (documentDetails) => Right(documentDetails),
    );
  }
}
