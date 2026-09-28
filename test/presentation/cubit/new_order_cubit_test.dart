import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_cubit.dart';

void main() {
  group('NewOrderCubit', () {
    test('stores order values in CreateOrderEntity', () {
      final cubit = NewOrderCubit();

      cubit.changeStep(2);
      cubit.updateFormValue('establishmentType', 'company');
      cubit.updateFormValue('applicantType', 'representative');
      cubit.updateFormValue('commercialName', 'Forsan');

      expect(cubit.state.orderEntity.currentStep, 2);
      expect(cubit.state.orderEntity.formValues, {
        'establishmentType': 'company',
        'applicantType': 'representative',
        'commercialName': 'Forsan',
      });

      cubit.close();
    });

    test('preserves existing form values when another value changes', () {
      final cubit = NewOrderCubit();

      cubit.updateFormValue('name', 'Ahmad');
      cubit.updateFormValue('city', 'Riyadh');

      expect(cubit.state.orderEntity.formValues, {
        'name': 'Ahmad',
        'city': 'Riyadh',
      });

      cubit.close();
    });

    test('stores and removes valid documents in CreateOrderEntity', () {
      final cubit = NewOrderCubit();
      final document = PlatformFile(
        name: 'license.pdf',
        size: 100,
      );

      expect(cubit.addDocuments([document]), 0);
      expect(cubit.state.orderEntity.documents, [document]);

      cubit.removeDocument(document);
      expect(cubit.state.orderEntity.documents, isEmpty);

      cubit.close();
    });
  });
}
