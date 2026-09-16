import 'package:dartz/dartz.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/helper/network_helper.dart';
import '../../../core/services/locator/locator.dart';
import '../../models/base/base_model.dart';

abstract class BaseRemoteDataSource<T> {
  BaseRemoteDataSource(this.endpoint);

  final String endpoint;

  Future<Either<AppException, BaseModel<T>?>> postData({
    required String endpoint,
    Map<String, dynamic>? data,
    T Function(Object? json)? fromJsonT,
    bool isFormData = true,
    bool dataMayBeAtRoot = false,
  }) async {
    final response = await locator<NetworkHelper>().post(
      endpoint,
      data: data,
      isFormDate: isFormData,
    );
    return response.fold(
      (error) => Left(error),
      (result) {
        final json = result.data;
        if (json is! Map<String, dynamic>) return const Right(null);
        final parser = fromJsonT ?? (_) => null as T;
        return Right(
          dataMayBeAtRoot
              ? BaseModel<T>.fromJsonWithRootData(json, parser)
              : BaseModel<T>.fromJson(json, parser),
        );
      },
    );
  }
}
