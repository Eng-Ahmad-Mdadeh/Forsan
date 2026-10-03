import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/legal_page/legal_page_model.dart';
import 'package:forsan/domain/entities/legal_page/legal_page_entity.dart';
import 'package:forsan/domain/repositories/legal_page/i_legal_page_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart' show Injectable, Named;

@Injectable(as: IUseCase<BaseModel<LegalPageModel>?, LegalPageEntity>)
@Named('LegalPage')
class LegalPageUseCase implements IUseCase<BaseModel<LegalPageModel>?, LegalPageEntity> {
  const LegalPageUseCase(this._repository);

  final ILegalPageRepository _repository;

  @override
  Future<Either<AppException, BaseModel<LegalPageModel>?>> call(
      LegalPageEntity params,
      ) {
    return _repository.getLegalPage(params);
  }
}
