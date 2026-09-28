import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/file_type_extension.dart';
import 'package:forsan/core/helper/file_picker_helper.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit({FilePickerHelper? filePickerHelper})
      : _filePickerHelper = filePickerHelper ?? FilePickerHelper(),
        super(const NewOrderState());

  final FilePickerHelper _filePickerHelper;

  static const int lastStep = 6;

  void changeStep(int step) {
    if (step < 0 ||
        step > lastStep ||
        step == state.orderEntity.currentStep) {
      return;
    }

    emit(
      state.copyWith(
        orderEntity: state.orderEntity.copyWith(currentStep: step),
      ),
    );
  }

  void updateFormValue(String fieldId, dynamic value) {
    final formValues = state.orderEntity.formValues;
    if (formValues[fieldId] == value) return;

    emit(
      state.copyWith(
        orderEntity: state.orderEntity.copyWith(
          formValues: {...formValues, fieldId: value},
        ),
      ),
    );
  }

  Future<int> pickDocumentForRequirement(String requirementId) async {
    final documents = await _filePickerHelper.pickDocuments(
      allowMultiple: false,
    );
    return addDocumentForRequirement(documents, requirementId: requirementId);
  }

  int addDocumentForRequirement(
    List<PlatformFile> documents, {
    required String requirementId,
  }) {
    final validDocuments = documents.where(
      (document) => document.isValidDocument,
    ).toList();
    final rejectedDocuments = documents.length - validDocuments.length;

    if (validDocuments.isNotEmpty) {
      final selectedDocument = validDocuments.first;
      final requirementDocuments = {
        ...state.orderEntity.requirementDocuments,
        requirementId: selectedDocument,
      };
      emit(
        state.copyWith(
          orderEntity: state.orderEntity.copyWith(
            requirementDocuments: requirementDocuments,
          ),
        ),
      );
    }

    return rejectedDocuments;
  }

  void removeDocumentForRequirement(String requirementId) {
    final requirementDocuments = Map<String, PlatformFile>.of(
      state.orderEntity.requirementDocuments,
    )..remove(requirementId);
    emit(
      state.copyWith(
        orderEntity: state.orderEntity.copyWith(
          requirementDocuments: requirementDocuments,
        ),
      ),
    );
  }
}
