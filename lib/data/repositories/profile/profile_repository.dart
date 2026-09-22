import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/profile/profile_model.dart';
import 'package:forsan/data/data_sources/profile/profile_remote_data_source.dart';
import 'package:forsan/domain/repositories/profile/i_profile_repository.dart';

@Injectable(as: IProfileRepository)
class ProfileRepository implements IProfileRepository{
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<ProfileModel>?>> upDateProfile(AuthEntity data) async {
    final response = await _remoteDataSource.upDateProfile(data);
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
}