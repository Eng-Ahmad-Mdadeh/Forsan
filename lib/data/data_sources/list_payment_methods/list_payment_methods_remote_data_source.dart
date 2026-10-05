import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:forsan/core/constants/api_endpoints.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/data_sources/base/base_remote_data_source.dart';
import 'package:forsan/data/models/list_payment_methods/list_payment_methods_model.dart';

@Injectable()
class ListPaymentMethodsRemoteDataSource
    extends BaseRemoteDataSource<List<ListPaymentMethodsModel>> {
  ListPaymentMethodsRemoteDataSource() : super(ApiEndpoints.user);

  Future<Either<AppException, BaseModel<List<ListPaymentMethodsModel>>?>>
  getListPaymentMethods() {
    return fetchData(
      endpoint: ApiEndpoints.listPaymentMethods,
      dataMayBeAtRoot: true,
      fromJsonT: (json) => (json as List<dynamic>)
          .map(
            (e) => ListPaymentMethodsModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
