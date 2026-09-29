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

    test('builds the next-step payload from the latest selected values', () {
      final cubit = NewOrderCubit();

      cubit.updateFormValue(
        'establishmentType',
        'single_shareholder',
      );
      final nextStepEntity = cubit.state.orderEntity.copyWith(currentStep: 1);

      expect(nextStepEntity.toUpdateJson(), {
        'formData': {'establishmentType': 'single_shareholder'},
        'currentStep': 2,
      });

      cubit.close();
    });

    test('stores the uploaded file id in CreateOrderEntity', () {
      final cubit = NewOrderCubit();

      cubit.setFileId('uploaded-file-id');

      expect(cubit.state.orderEntity.fileId, 'uploaded-file-id');

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
        acceptedTypes: const ['pdf'],
        maxSize: 1024,
      );

      expect(
        cubit.state.orderEntity.requirementDocuments['idCopy'],
        firstDocument,
      );

      cubit.addDocumentForRequirement(
        [replacementDocument],
        requirementId: 'idCopy',
        acceptedTypes: const ['pdf'],
        maxSize: 1024,
      );

      expect(
        cubit.state.orderEntity.requirementDocuments['idCopy'],
        replacementDocument,
      );

      cubit.removeDocumentForRequirement('idCopy');
      expect(cubit.state.orderEntity.requirementDocuments, isEmpty);

      cubit.close();
    });

    test('accepts new document types supplied by the requirement', () {
      final cubit = NewOrderCubit();
      final document = PlatformFile(name: 'company-record.docx', size: 100);

      final rejectedDocuments = cubit.addDocumentForRequirement(
        [document],
        requirementId: 'companyRecord',
        acceptedTypes: const ['docx'],
        maxSize: 1024,
      );

      expect(rejectedDocuments, 0);
      expect(
        cubit.state.orderEntity.requirementDocuments['companyRecord'],
        document,
      );

      cubit.close();
    });
  });
}
