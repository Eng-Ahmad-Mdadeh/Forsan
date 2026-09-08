import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:forsan/domain/repositories/auth/i_auth_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/data/models/auth/auth_model.dart';
import 'package:forsan/data/models/base/base_model.dart';

import '../../../core/exceptions/app_exception.dart';

@Injectable(as: IUseCase<BaseModel<AuthModel>?, AuthEntity>)
@Named('Login')
class LoginUsecase implements IUseCase<BaseModel<AuthModel>?, AuthEntity> {
  final IAuthRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<Either<AppException, BaseModel<AuthModel>?>> call(AuthEntity data) {
    return _repository.login(data);
  }
}
