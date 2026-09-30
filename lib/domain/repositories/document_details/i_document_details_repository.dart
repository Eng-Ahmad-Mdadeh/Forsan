import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_details/document_details_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';

abstract interface class IDocumentDetailsRepository {
  Future<Either<AppException, BaseModel<DocumentDetailsModel>?>>
  getDocumentDetails(DocumentEntity entity);
}
