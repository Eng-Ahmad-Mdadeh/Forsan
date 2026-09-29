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
import '../../../data/data_sources/create_order/create_order_remote_data_source.dart'
    as _i832;
import '../../../data/data_sources/create_order/service_type/service_type_remote_data_source.dart'
    as _i619;
import '../../../data/data_sources/file/file_remote_data_source.dart' as _i158;
import '../../../data/data_sources/home/home_remote_data_source.dart' as _i949;
import '../../../data/data_sources/order_details/order_details_remote_data_source.dart'
    as _i588;
import '../../../data/data_sources/order_list/order_list_remote_data_source.dart'
    as _i734;
import '../../../data/data_sources/order_steps/order_steps_remote_data_source.dart'
    as _i984;
import '../../../data/data_sources/profile/profile_remote_data_source.dart'
    as _i265;
import '../../../data/models/auth/auth_model.dart' as _i323;
import '../../../data/models/base/base_model.dart' as _i480;
import '../../../data/models/create_order/create_order_model.dart' as _i210;
import '../../../data/models/file/file_model.dart' as _i86;
import '../../../data/models/home/home_model.dart' as _i703;
import '../../../data/models/order_details/order_details_model.dart' as _i80;
import '../../../data/models/order_list/order_list_model.dart' as _i1016;
import '../../../data/models/order_steps/order_steps_model.dart' as _i196;
import '../../../data/models/profile/profile_model.dart' as _i705;
import '../../../data/models/service_type/service_type_model.dart' as _i964;
import '../../../data/repositories/auth/auth_repository.dart' as _i202;
import '../../../data/repositories/create_order/create_order_repository.dart'
    as _i264;
import '../../../data/repositories/create_order/service_type/service_type_repository.dart'
    as _i254;
import '../../../data/repositories/file/file_repository.dart' as _i841;
import '../../../data/repositories/home/home_repository.dart' as _i13;
import '../../../data/repositories/order_details/order_details_repository.dart'
    as _i664;
import '../../../data/repositories/order_list/order_list_repository.dart'
    as _i258;
import '../../../data/repositories/order_steps/order_steps_repository.dart'
    as _i1001;
import '../../../data/repositories/profile/profile_repository.dart' as _i922;
import '../../../domain/entities/auth/auth_entity.dart' as _i450;
import '../../../domain/entities/create_order/create_order_entity.dart'
    as _i232;
import '../../../domain/entities/order_details/order_details_entity.dart'
    as _i513;
import '../../../domain/entities/order_list/order_list_entity.dart' as _i729;
import '../../../domain/repositories/auth/i_auth_repository.dart' as _i1064;
import '../../../domain/repositories/create_order/i_create_order_repository.dart'
    as _i352;
import '../../../domain/repositories/create_order/service_type/i_service_type_repository.dart'
    as _i637;
import '../../../domain/repositories/file/i_file_repository.dart' as _i944;
import '../../../domain/repositories/home/i_home_repository.dart' as _i751;
import '../../../domain/repositories/order_details/i_order_details_repository.dart'
    as _i122;
import '../../../domain/repositories/order_list/i_order_list_repository.dart'
    as _i601;
import '../../../domain/repositories/order_steps/i_order_steps_repository.dart'
    as _i372;
import '../../../domain/repositories/profile/i_profile_repository.dart'
    as _i1042;
import '../../../domain/usecases/auth/check_code_usecase.dart' as _i298;
import '../../../domain/usecases/auth/login_usecase.dart' as _i895;
import '../../../domain/usecases/auth/logout_usecase.dart' as _i596;
import '../../../domain/usecases/auth/resend_code_usecase.dart' as _i968;
import '../../../domain/usecases/create_order/create_order_use_case.dart'
    as _i232;
import '../../../domain/usecases/create_order/service_type/service_type_use_case.dart'
    as _i80;
import '../../../domain/usecases/file/upload_file_use_case.dart' as _i894;
import '../../../domain/usecases/home/home_use_case.dart' as _i208;
import '../../../domain/usecases/i_use_case.dart' as _i795;
import '../../../domain/usecases/order_details/order_details_use_case.dart'
    as _i675;
import '../../../domain/usecases/order_list/order_list_use_case.dart' as _i72;
import '../../../domain/usecases/order_steps/order_steps_use_case.dart'
    as _i1032;
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
    gh.factory<_i832.CreateOrderRemoteDataSource>(
      () => _i832.CreateOrderRemoteDataSource(),
    );
    gh.factory<_i619.ServiceTypeRemoteDataSource>(
      () => _i619.ServiceTypeRemoteDataSource(),
    );
    gh.factory<_i158.FileRemoteDataSource>(() => _i158.FileRemoteDataSource());
    gh.factory<_i949.HomeRemoteDataSource>(() => _i949.HomeRemoteDataSource());
    gh.factory<_i588.OrderDetailsRemoteDataSource>(
      () => _i588.OrderDetailsRemoteDataSource(),
    );
    gh.factory<_i734.OrderListRemoteDataSource>(
      () => _i734.OrderListRemoteDataSource(),
    );
    gh.factory<_i984.OrderStepsRemoteDataSource>(
      () => _i984.OrderStepsRemoteDataSource(),
    );
    gh.factory<_i265.ProfileRemoteDataSource>(
      () => _i265.ProfileRemoteDataSource(),
    );
    gh.lazySingleton<_i1052.DeviceInfoHelper>(() => _i1052.DeviceInfoHelper());
    gh.factory<_i601.IOrderListRepository>(
      () => _i258.OrderListRepository(gh<_i734.OrderListRemoteDataSource>()),
    );
    gh.factory<_i751.IHomeRepository>(
      () => _i13.HomeRepository(gh<_i949.HomeRemoteDataSource>()),
    );
    gh.factory<_i352.ICreateOrderRepository>(
      () =>
          _i264.CreateOrderRepository(gh<_i832.CreateOrderRemoteDataSource>()),
    );
    gh.factory<_i944.IFileRepository>(
      () => _i841.FileRepository(gh<_i158.FileRemoteDataSource>()),
    );
    gh.factory<
      _i795.IUseCase<
        _i480.BaseModel<_i1016.OrderListModel>?,
        _i729.OrderListEntity
      >
    >(
      () => _i72.OrderListUseCase(gh<_i601.IOrderListRepository>()),
      instanceName: 'OrderList',
    );
    gh.factory<_i637.IServiceTypeRepository>(
      () =>
          _i254.ServiceTypeRepository(gh<_i619.ServiceTypeRemoteDataSource>()),
    );
    gh.factory<_i372.IOrderStepsRepository>(
      () => _i1001.OrderStepsRepository(gh<_i984.OrderStepsRemoteDataSource>()),
    );
    gh.factory<_i1042.IProfileRepository>(
      () => _i922.ProfileRepository(gh<_i265.ProfileRemoteDataSource>()),
    );
    gh.factory<
      _i795.IUseCase<
        _i480.BaseModel<_i210.CreateOrderModel>?,
        _i232.CreateOrderEntity
      >
    >(
      () => _i232.CreateOrderUseCase(gh<_i352.ICreateOrderRepository>()),
      instanceName: 'CreateOrder',
    );
    gh.factory<
      _i795.IUseCase<_i480.BaseModel<List<_i964.ServiceTypeModel>>?, Null>
    >(
      () => _i80.ServiceTypeUseCase(gh<_i637.IServiceTypeRepository>()),
      instanceName: 'ServiceType',
    );
    gh.factory<_i444.AuthRemoteDataSource>(
      () => _i444.AuthRemoteDataSource(gh<_i1052.DeviceInfoHelper>()),
    );
    gh.factory<
      _i795.IUseCase<
        _i480.BaseModel<_i196.OrderStepsModel>?,
        _i232.CreateOrderEntity
      >
    >(
      () => _i1032.OrderStepsUseCase(gh<_i372.IOrderStepsRepository>()),
      instanceName: 'OrderSteps',
    );
    gh.factory<_i122.IOrderDetailsRepository>(
      () => _i664.OrderDetailsRepository(
        gh<_i588.OrderDetailsRemoteDataSource>(),
      ),
    );
    gh.factory<_i795.IUseCase<_i480.BaseModel<_i703.HomeModel>?, Null>>(
      () => _i208.HomeUseCase(gh<_i751.IHomeRepository>()),
      instanceName: 'Home',
    );
    gh.factory<
      _i795.IUseCase<
        _i480.BaseModel<_i80.OrderDetailsModel>?,
        _i513.OrderDetailsEntity
      >
    >(
      () => _i675.OrderDetailsUseCase(gh<_i122.IOrderDetailsRepository>()),
      instanceName: 'OrderDetails',
    );
    gh.factory<
      _i795.IUseCase<_i480.BaseModel<_i86.FileModel>?, _i232.CreateOrderEntity>
    >(
      () => _i894.UploadFileUseCase(gh<_i944.IFileRepository>()),
      instanceName: 'uploadFile',
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
