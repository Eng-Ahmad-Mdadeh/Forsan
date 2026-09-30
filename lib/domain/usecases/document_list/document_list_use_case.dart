import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_list/document_list_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:forsan/domain/repositories/document_list/i_document_list_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUseCase<BaseModel<DocumentListModel>?, DocumentEntity>)
@Named('DocumentList')
class DocumentListUseCase
    implements IUseCase<BaseModel<DocumentListModel>?, DocumentEntity> {
  const DocumentListUseCase(this._repository);

  final IDocumentListRepository _repository;

  @override
  Future<Either<AppException, BaseModel<DocumentListModel>?>> call(
    DocumentEntity params,
  ) {
    return _repository.getDocumentList(params);
  }
}
