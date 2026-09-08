// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../data/data_sources/auth/auth_remote_data_source.dart' as _i1;
import '../../../data/data_sources/auth/auth_storage_data_source.dart' as _i2;
import '../../../data/repositories/auth/auth_repository.dart' as _i3;
import '../../../data/models/auth/auth_model.dart' as _i11;
import '../../../data/models/base/base_model.dart' as _i12;
import '../../../domain/entities/auth/auth_entity.dart' as _i13;
import '../../../domain/repositories/auth/i_auth_repository.dart' as _i4;
import '../../../domain/usecases/i_use_case.dart' as _i14;
import '../../../domain/usecases/auth/check_code_usecase.dart' as _i5;
import '../../../domain/usecases/auth/login_usecase.dart' as _i6;
import '../../../domain/usecases/auth/logout_usecase.dart' as _i7;
import '../../../domain/usecases/auth/resend_code_usecase.dart' as _i8;
import '../../helper/local_storage_helper.dart' as _i9;
import '../../helper/network_helper.dart' as _i10;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i9.LocalStorageHelper>(() => _i9.LocalStorageHelper());
    gh.factory<_i10.NetworkHelper>(() => _i10.NetworkHelper());
    gh.factory<_i1.AuthRemoteDataSource>(() => _i1.AuthRemoteDataSource());
    gh.factory<_i2.AuthStorageDataSource>(() => _i2.AuthStorageDataSource());
    gh.factory<_i4.IAuthRepository>(
      () => _i3.AuthRepository(
        gh<_i1.AuthRemoteDataSource>(),
        gh<_i2.AuthStorageDataSource>(),
      ),
    );
    gh.factory<_i14.IUseCase<_i12.BaseModel<_i11.AuthModel>?, _i13.AuthEntity>>(
      () => _i5.CheckCodeUsecase(gh<_i4.IAuthRepository>()),
      instanceName: 'CheckCode',
    );
    gh.factory<_i14.IUseCase<_i12.BaseModel<_i11.AuthModel>?, _i13.AuthEntity>>(
      () => _i6.LoginUsecase(gh<_i4.IAuthRepository>()),
      instanceName: 'Login',
    );
    gh.factory<_i14.IUseCase<void, Null>>(
      () => _i7.LogoutUsecase(gh<_i4.IAuthRepository>()),
      instanceName: 'Logout',
    );
    gh.factory<_i14.IUseCase<_i12.BaseModel<_i11.AuthModel>?, _i13.AuthEntity>>(
      () => _i8.ResendCodeUsecase(gh<_i4.IAuthRepository>()),
      instanceName: 'ResendCode',
    );
    return this;
  }
}
