import 'package:forsan/data/models/profile/profile_model.dart';
import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:forsan/domain/repositories/profile/i_profile_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/data/models/base/base_model.dart';
import '../../../core/exceptions/app_exception.dart';

@Injectable(as: IUseCase<BaseModel<ProfileModel>?, AuthEntity>)
@Named('Profile')
class ProfileUseCase implements IUseCase<BaseModel<ProfileModel>?, AuthEntity> {
  final IProfileRepository _repository;

  ProfileUseCase(this._repository);

  @override
  Future<Either<AppException, BaseModel<ProfileModel>?>> call(AuthEntity data) {
    return _repository.upDateProfile(data);
  }
}
