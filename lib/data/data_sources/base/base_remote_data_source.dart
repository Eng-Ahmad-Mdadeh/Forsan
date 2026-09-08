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
  }) async {
    final response = await locator<NetworkHelper>().post(endpoint, data: data);
    return response.fold(
      (error) => Left(error),
      (result) {
        final json = result.data;
        if (json is! Map<String, dynamic>) return const Right(null);
        return Right(
          BaseModel<T>.fromJson(
            json,
            fromJsonT ?? (_) => null as T,
          ),
        );
      },
    );
  }
}
