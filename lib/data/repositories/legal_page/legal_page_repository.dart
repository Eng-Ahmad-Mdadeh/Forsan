import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/legal_page/legal_page_remote_data_source.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/legal_page/legal_page_model.dart';
import 'package:forsan/domain/entities/legal_page/legal_page_entity.dart';
import 'package:forsan/domain/repositories/legal_page/i_legal_page_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ILegalPageRepository)
class LegalPageRepository implements ILegalPageRepository {
  LegalPageRepository(this._remoteDataSource);

  final LegalPageRemoteDataSource _remoteDataSource;

  @override
  Future<Either<AppException, BaseModel<LegalPageModel>?>> getLegalPage(
    LegalPageEntity entity,
  ) {
    return _remoteDataSource.getLegalPage(entity);
  }
}
