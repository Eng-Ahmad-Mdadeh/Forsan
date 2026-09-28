import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forsan/core/extension/file_type_extension.dart';
import 'package:forsan/core/helper/file_picker_helper.dart';
import 'package:forsan/core/helper/media_picker_helper.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit({
    FilePickerHelper? filePickerHelper,
    MediaPickerHelper? mediaPickerHelper,
  })
      : _filePickerHelper = filePickerHelper ?? FilePickerHelper(),
        _mediaPickerHelper = mediaPickerHelper ?? MediaPickerHelper(),
        super(const NewOrderState());

  final FilePickerHelper _filePickerHelper;
  final MediaPickerHelper _mediaPickerHelper;

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

  Future<int> pickDocumentForRequirement(
    String requirementId, {
    List<String> allowedExtensions = const ['pdf'],
  }) async {
    final documents = await _filePickerHelper.pickDocuments(
      allowMultiple: false,
      allowedExtensions: allowedExtensions,
    );
    return addDocumentForRequirement(documents, requirementId: requirementId);
  }

  Future<int> pickImageForRequirement(
    BuildContext context,
    String requirementId,
  ) async {
    final image = await _mediaPickerHelper.pickImageFile(context);
    if (image == null) return 0;

    final document = PlatformFile(
      name: image.name,
      path: image.path,
      size: await image.length(),
    );
    return addDocumentForRequirement(
      [document],
      requirementId: requirementId,
    );
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
