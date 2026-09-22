import 'package:forsan/data/models/home/home_model.dart';
import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';

abstract interface class IHomeRepository {
  Future<Either<AppException, BaseModel<HomeModel>?>> getHome();


}
