import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';
import 'package:forsan/domain/repositories/document_details/i_document_details_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUseCase<BaseModel<DocumentDetailsModel>?, DocumentEntity>)
@Named('DocumentDetails')
class DocumentDetailsUseCase
    implements IUseCase<BaseModel<DocumentDetailsModel>?, DocumentEntity> {
  const DocumentDetailsUseCase(this._repository);

  final IDocumentDetailsRepository _repository;

  @override
  Future<Either<AppException, BaseModel<DocumentDetailsModel>?>> call(
    DocumentEntity params,
  ) {
    return _repository.getDocumentDetails(params);
  }
}
