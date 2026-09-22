import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/core/helper/device_info_helper.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/auth/auth_model.dart';
import 'package:forsan/data/models/base/base_model.dart';

@Injectable()
class AuthRemoteDataSource extends BaseRemoteDataSource<AuthModel> {
  AuthRemoteDataSource(this._deviceInfoHelper) : super(ApiEndpoints.user);

  final DeviceInfoHelper _deviceInfoHelper;

  Future<Either<AppException, BaseModel<AuthModel>?>> login(AuthEntity data) {
    return postData(
      endpoint: '${ApiEndpoints.auth}${ApiEndpoints.sendOtp}',
      fromJsonT: (json) => AuthModel.fromJson(json as Map<String, dynamic>),
      data: data.toJson(),
      isFormData: false,
      dataMayBeAtRoot: true,
    );
  }

  Future<Either<AppException, BaseModel<AuthModel>?>> checkCode(
    AuthEntity data,
  ) async {
    final deviceData = await _deviceInfoHelper.getDeviceData();
    return postData(
      endpoint: '${ApiEndpoints.auth}${ApiEndpoints.verifyOtp}',
      fromJsonT: (json) => AuthModel.fromJson(json as Map<String, dynamic>),
      data: {...data.toJson(), 'device': deviceData},
      isFormData: false,
      dataMayBeAtRoot: true,
    );
  }

  Future<Either<AppException, BaseModel<AuthModel>?>> resendCode(
    AuthEntity data,
  ) {
    return postData(
      endpoint: ApiEndpoints.login,
      // fromJsonT: (json) => AuthModel.fromJson(json as Map<String, dynamic>),
      data: data.toJson(),
    );
  }
}
