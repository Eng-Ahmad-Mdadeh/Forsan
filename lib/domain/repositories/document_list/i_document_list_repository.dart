import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/document_list/document_list_model.dart';
import 'package:forsan/domain/entities/document/document_entity.dart';

abstract interface class IDocumentListRepository {
  Future<Either<AppException, BaseModel<DocumentListModel>?>> getDocumentList(
    DocumentEntity entity,
  );
}
