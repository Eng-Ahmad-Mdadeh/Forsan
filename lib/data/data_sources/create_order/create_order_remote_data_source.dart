

@Injectable()
class CreateOrderRemoteDataSource extends BaseRemoteDataSource<HomeModel> {
  CreateOrderRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<HomeModel>?>> getHome() {
    return fetchData(
      endpoint: ApiEndpoints.home,
      dataMayBeAtRoot: true,
      fromJsonT: (json) => HomeModel.fromJson(json as Map<String, dynamic>),
    );
  }
}