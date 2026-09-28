import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/repositories/create_order/i_create_order_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: IUseCase<BaseModel<void>?, CreateOrderEntity>)
@Named('uploadFile')
class UploadFileUseCase implements IUseCase<BaseModel<void>?, CreateOrderEntity> {
  final ICreateOrderRepository _repository;

  UploadFileUseCase(this._repository);

  @override
  Future<Either<AppException, BaseModel<void>?>> call(CreateOrderEntity data) {
    return _repository.uploadFile(data);
  }
}