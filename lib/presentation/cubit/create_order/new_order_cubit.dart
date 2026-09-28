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

  Future<int> pickDocuments() async {
    final documents = await _filePickerHelper.pickDocuments();
    return addDocuments(documents);
  }

  Future<int> pickDocumentForRequirement(String requirementId) async {
    final documents = await _filePickerHelper.pickDocuments(
      allowMultiple: false,
    );
    return addDocuments(documents, requirementId: requirementId);
  }

  int addDocuments(
    List<PlatformFile> documents, {
    String? requirementId,
  }) {
    final validDocuments = documents.where(
      (document) => document.isValidDocument,
    ).toList();
    final rejectedDocuments = documents.length - validDocuments.length;

    if (validDocuments.isNotEmpty) {
      final selectedDocument = validDocuments.first;
      final requirementDocuments = {
        ...state.orderEntity.requirementDocuments,
        if (requirementId != null) requirementId: selectedDocument,
      };
      final currentDocuments = requirementId == null
          ? state.orderEntity.documents
          : state.orderEntity.documents.where(
              (document) =>
                  document !=
                  state.orderEntity.requirementDocuments[requirementId],
            );
      emit(
        state.copyWith(
          orderEntity: state.orderEntity.copyWith(
            documents: [
              ...currentDocuments,
              ...(requirementId == null
                  ? validDocuments
                  : [selectedDocument]),
            ],
            requirementDocuments: requirementDocuments,
          ),
        ),
      );
    }

    return rejectedDocuments;
  }

  void removeDocument(PlatformFile document) {
    final documents = List<PlatformFile>.of(state.orderEntity.documents)
      ..remove(document);
    final requirementDocuments = Map<String, PlatformFile>.of(
      state.orderEntity.requirementDocuments,
    )..removeWhere((_, value) => value == document);
    emit(
      state.copyWith(
        orderEntity: state.orderEntity.copyWith(
          documents: documents,
          requirementDocuments: requirementDocuments,
        ),
      ),
    );
  }
}
