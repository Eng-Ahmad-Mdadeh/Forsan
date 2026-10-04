import 'package:forsan/data/models/profile/profile_model.dart';
import 'package:forsan/domain/repositories/profile/i_profile_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/data/models/base/base_model.dart';
import '../../../core/exceptions/app_exception.dart';

@Injectable(as: IUseCase<BaseModel<ProfileModel>?, Null>)
@Named('GetProfile')
class GetProfileUseCase implements IUseCase<BaseModel<ProfileModel>?, Null> {
  final IProfileRepository _repository;

  GetProfileUseCase(this._repository);

  @override
  Future<Either<AppException, BaseModel<ProfileModel>?>> call(Null n) {
    return _repository.getProfile();
  }
}
