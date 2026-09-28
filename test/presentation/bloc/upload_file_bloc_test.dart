import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/core/exceptions/app_exception.dart';
import 'package:forsan/data/models/base/base_model.dart';
import 'package:forsan/domain/entities/create_order/create_order_entity.dart';
import 'package:forsan/domain/usecases/i_use_case.dart';
import 'package:forsan/presentation/bloc/create_order/upload_file/upload_file_bloc.dart';

void main() {
  group('UploadFileBloc', () {
    late _UploadFileUseCase useCase;
    late UploadFileBloc bloc;

    setUp(() {
      useCase = _UploadFileUseCase();
      bloc = UploadFileBloc(uploadFile: useCase);
    });

    tearDown(() => bloc.close());

    test('emits loading then loaded when upload succeeds', () async {
      const entity = CreateOrderEntity(orderId: 'order-1');
      const response = BaseModel<void>(success: true);
      useCase.response = const Right(response);

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder([
          isA<UploadFileLoading>().having(
            (state) => state.requirementId,
            'requirementId',
            'document-1',
          ),
          isA<UploadFileLoaded>().having(
            (state) => state.response,
            'response',
            response,
          ),
        ]),
      );

      bloc.add(
        const UploadFileEvent(entity, requirementId: 'document-1'),
      );
      await expectation;

      expect(useCase.params, [entity]);
    });

    test('emits loading then failed when upload fails', () async {
      const entity = CreateOrderEntity(orderId: 'order-1');
      useCase.response = Left(AppException('Upload failed'));

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder([
          isA<UploadFileLoading>(),
          isA<UploadFileFailed>().having(
            (state) => state.message,
            'message',
            'Upload failed',
          ),
        ]),
      );

      bloc.add(
        const UploadFileEvent(entity, requirementId: 'document-1'),
      );
      await expectation;
    });
  });
}

class _UploadFileUseCase
    implements IUseCase<BaseModel<void>?, CreateOrderEntity> {
  late Either<AppException, BaseModel<void>?> response;
  final List<CreateOrderEntity> params = [];

  @override
  Future<Either<AppException, BaseModel<void>?>> call(
    CreateOrderEntity params,
  ) async {
    this.params.add(params);
    return response;
  }
}
