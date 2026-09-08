import 'package:dartz/dartz.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/helper/local_storage_helper.dart';
import '../../../core/services/locator/locator.dart';

abstract class BaseStorageDataSource {
  BaseStorageDataSource(this.boxName);

  final String boxName;

  LocalStorageHelper get _storage => locator<LocalStorageHelper>();

  Future<Either<AppException, dynamic>> saveData({required String key, dynamic data}) =>
      _storage.saveValue(boxName, key, data);

  Future<Either<AppException, dynamic>> getData({required String key}) =>
      _storage.getValue(boxName, key);

  Future<Either<AppException, bool>> deleteData({required String key}) =>
      _storage.deleteValue(boxName, key);
}
