// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../data/data_sources/auth/auth_remote_data_source.dart' as _i444;
import '../../../data/data_sources/auth/auth_storage_data_source.dart' as _i244;
import '../../../data/data_sources/profile/profile_remote_data_source.dart'
    as _i265;
import '../../../data/models/auth/auth_model.dart' as _i323;
import '../../../data/models/base/base_model.dart' as _i480;
import '../../../data/models/profile/profile_model.dart' as _i705;
import '../../../data/repositories/auth/auth_repository.dart' as _i202;
import '../../../data/repositories/profile/profile_repository.dart' as _i922;
import '../../../domain/entities/auth/auth_entity.dart' as _i450;
import '../../../domain/repositories/auth/i_auth_repository.dart' as _i1064;
import '../../../domain/repositories/profile/i_profile_repository.dart'
    as _i1042;
import '../../../domain/usecases/auth/check_code_usecase.dart' as _i298;
import '../../../domain/usecases/auth/login_usecase.dart' as _i895;
import '../../../domain/usecases/auth/logout_usecase.dart' as _i596;
import '../../../domain/usecases/auth/resend_code_usecase.dart' as _i968;
import '../../../domain/usecases/i_use_case.dart' as _i795;
import '../../../domain/usecases/profile/profile_use_case.dart' as _i76;
import '../../helper/device_info_helper.dart' as _i1052;
import '../../helper/local_storage_helper.dart' as _i218;
import '../../helper/network_helper.dart' as _i779;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i218.LocalStorageHelper>(() => _i218.LocalStorageHelper());
    gh.factory<_i779.NetworkHelper>(() => _i779.NetworkHelper());
    gh.factory<_i244.AuthStorageDataSource>(
      () => _i244.AuthStorageDataSource(),
    );
    gh.factory<_i265.ProfileRemoteDataSource>(
      () => _i265.ProfileRemoteDataSource(),
    );
    gh.lazySingleton<_i1052.DeviceInfoHelper>(() => _i1052.DeviceInfoHelper());
    gh.factory<_i1042.IProfileRepository>(
      () => _i922.ProfileRepository(gh<_i265.ProfileRemoteDataSource>()),
    );
    gh.factory<_i444.AuthRemoteDataSource>(
      () => _i444.AuthRemoteDataSource(gh<_i1052.DeviceInfoHelper>()),
    );
    gh.factory<_i1064.IAuthRepository>(
      () => _i202.AuthRepository(
        gh<_i444.AuthRemoteDataSource>(),
        gh<_i244.AuthStorageDataSource>(),
      ),
    );
    gh.factory<
      _i795.IUseCase<_i480.BaseModel<_i705.ProfileModel>?, _i450.AuthEntity>
    >(
      () => _i76.ProfileUseCase(gh<_i1042.IProfileRepository>()),
      instanceName: 'Profile',
    );
    gh.factory<
      _i795.IUseCase<_i480.BaseModel<_i323.AuthModel>?, _i450.AuthEntity>
    >(
      () => _i895.LoginUsecase(gh<_i1064.IAuthRepository>()),
      instanceName: 'Login',
    );
    gh.factory<_i795.IUseCase<void, Null>>(
      () => _i596.LogoutUsecase(gh<_i1064.IAuthRepository>()),
      instanceName: 'LogOut',
    );
    gh.factory<
      _i795.IUseCase<_i480.BaseModel<_i323.AuthModel>?, _i450.AuthEntity>
    >(
      () => _i298.CheckCodeUsecase(gh<_i1064.IAuthRepository>()),
      instanceName: 'CheckCode',
    );
    gh.factory<
      _i795.IUseCase<_i480.BaseModel<_i323.AuthModel>?, _i450.AuthEntity>
    >(
      () => _i968.ResendCodeUsecase(gh<_i1064.IAuthRepository>()),
      instanceName: 'ResendCode',
    );
    return this;
  }
}
