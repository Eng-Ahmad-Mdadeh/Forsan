import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/home/home_model.dart';
import 'package:forsan/data/data_sources/home/home_remote_data_source.dart';
import 'package:forsan/domain/repositories/home/i_home_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository implements IHomeRepository{
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, BaseModel<HomeModel>?>> getHome() async {
    final response = await _remoteDataSource.getHome();
    return response.fold(
          (l) async => Left(l),
          (r) async {
        return Right(r);
      },
    );
  }
}