import 'package:dartz/dartz.dart';

import '../../core/exceptions/app_exception.dart';

abstract interface class IUseCase<Result, Params> {
  Future<Either<AppException, Result>> call(Params params);
}
