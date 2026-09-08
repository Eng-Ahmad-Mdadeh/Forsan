import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/auth/auth_model.dart';
import 'package:forsan/data/models/base/base_model.dart';

abstract interface class IAuthRepository {
  Future<Either<AppException, BaseModel<AuthModel>?>> login(AuthEntity data);

  Future<Either<AppException, BaseModel<AuthModel>?>> checkCode(AuthEntity data);

  Future<Either<AppException, BaseModel<AuthModel>?>> resendCode(AuthEntity data);

  Future<Either<AppException, void>> logout();
}
