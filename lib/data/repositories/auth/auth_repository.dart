import 'package:forsan/domain/entity/auth/auth_entity.dart';
import 'package:forsan/domain/repository/auth/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/data_sources/auth/auth_remote_data_source.dart';
import 'package:forsan/data/data_sources/auth/auth_storage_data_source.dart';
import 'package:forsan/data/model/auth/auth_model.dart';
import 'package:forsan/data/model/base/base_model.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthStorageDataSource _localDataSource;

  AuthRepository(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<AppException, BaseModel<AuthModel>?>> login(AuthEntity data) {
    return _remoteDataSource.login(data);
  }

  @override
  Future<Either<AppException, BaseModel<AuthModel>?>> checkCode(AuthEntity data) async {
    final response = await _remoteDataSource.checkCode(data);
    return response.fold(
      (l) async => Left(l),
      (r) async {
        await _localDataSource.storeRememberMe(data.rememberMe!);
        await _localDataSource.storeToken(r?.data?.accessToken);
        // await _localDataSource.storeProfileComplete(r?.data?.user?.profileComplete ?? false);
        return Right(r);
      },
    );
  }

  //
  @override
  Future<Either<AppException, BaseModel<AuthModel>?>> resendCode(AuthEntity data) {
    return _remoteDataSource.resendCode(data);
  }

  @override
  Future<Either<AppException, void>> logout() async {
    await _localDataSource.deleteProfileComplete();
    return _localDataSource.logout();
  }
}
