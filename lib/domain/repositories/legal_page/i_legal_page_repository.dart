import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/legal_page/legal_page_model.dart';
import 'package:forsan/domain/entities/legal_page/legal_page_entity.dart';

abstract interface class ILegalPageRepository {
  Future<Either<AppException, BaseModel<LegalPageModel>?>> getLegalPage(
    LegalPageEntity entity,
  );
}
