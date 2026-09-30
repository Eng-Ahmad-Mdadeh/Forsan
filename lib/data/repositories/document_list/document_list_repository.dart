import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/document_list/document_list_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_list/document_list_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:forsan/domain/repositories/document_list/i_document_list_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IDocumentListRepository)
class DocumentListRepository implements IDocumentListRepository {
  final DocumentListRemoteDataSource _remoteDataSource;

  DocumentListRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<DocumentListModel>?>> getDocumentList(
    DocumentEntity entity,
  ) async {
    final response = await _remoteDataSource.getDocumentList(entity);
    return response.fold(
      (failure) => Left(failure),
      (documentList) => Right(documentList),
    );
  }
}
