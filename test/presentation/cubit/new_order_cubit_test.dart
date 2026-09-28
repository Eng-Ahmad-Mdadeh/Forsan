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

    test('associates one document with its requirement', () {
      final cubit = NewOrderCubit();
      final firstDocument = PlatformFile(name: 'identity.pdf', size: 100);
      final replacementDocument = PlatformFile(
        name: 'new-identity.pdf',
        size: 100,
      );

      cubit.addDocumentForRequirement(
        [firstDocument],
        requirementId: 'idCopy',
      );

      expect(
        cubit.state.orderEntity.requirementDocuments['idCopy'],
        firstDocument,
      );

      cubit.addDocumentForRequirement(
        [replacementDocument],
        requirementId: 'idCopy',
      );

      expect(
        cubit.state.orderEntity.requirementDocuments['idCopy'],
        replacementDocument,
      );

      cubit.removeDocumentForRequirement('idCopy');
      expect(cubit.state.orderEntity.requirementDocuments, isEmpty);

      cubit.close();
    });
  });
}
