import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/auth/auth_model.dart';

import 'package:forsan/data/models/profile/profile_model.dart';
import 'package:forsan/data/models/home/home_model.dart';

@Injectable()
class HomeRemoteDataSource extends BaseRemoteDataSource<HomeModel> {
  HomeRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<HomeModel>?>> getHome() {
    return fetchData(
      endpoint: ApiEndpoints.home,
      fromJsonT: (json) => HomeModel.fromJson(json as Map<String, dynamic>),
    );
  }
}