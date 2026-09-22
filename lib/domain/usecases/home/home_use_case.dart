import 'package:forsan/data/models/home/home_model.dart';
import 'package:forsan/domain/repositories/home/i_home_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/data/models/base/base_model.dart';
import '../../../core/exceptions/app_exception.dart';

@Injectable(as: IUseCase<BaseModel<HomeModel>?, Null>)
@Named('Home')
class HomeUseCase implements IUseCase<BaseModel<HomeModel>?, Null> {
  final IHomeRepository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<AppException, BaseModel<HomeModel>?>> call(Null n) {
    return _repository.getHome();
  }
}
