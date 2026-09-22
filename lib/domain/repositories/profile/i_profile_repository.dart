import 'package:forsan/data/models/profile/profile_model.dart';
import 'package:forsan/domain/entities/auth/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';

abstract interface class IProfileRepository {
  Future<Either<AppException, BaseModel<ProfileModel>?>> upDateProfile(AuthEntity data);


}
