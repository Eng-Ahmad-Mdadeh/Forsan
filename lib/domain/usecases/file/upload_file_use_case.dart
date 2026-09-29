
import 'package:dartz/dartz.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/data/models/file/file_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/repositories/file/i_file_repository.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: IUseCase<BaseModel<FileModel>?, CreateOrderEntity>)
@Named('uploadFile')
class UploadFileUseCase implements IUseCase<BaseModel<FileModel>?, CreateOrderEntity> {
  final IFileRepository _repository;

  UploadFileUseCase(this._repository);

  @override
  Future<Either<AppException, BaseModel<FileModel>?>> call(CreateOrderEntity data) {
    return _repository.uploadFile(data);
  }
}