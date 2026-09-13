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
    if (step < 0 || step > lastStep || step == state.currentStep) return;

    emit(state.copyWith(currentStep: step));
  }

  void selectEstablishmentType(String type) {
    if (type == state.establishmentType) return;

    emit(state.copyWith(establishmentType: type));
  }

  void selectApplicantType(String type) {
    if (type == state.applicantType) return;

    emit(state.copyWith(applicantType: type));
  }

  Future<int> pickDocuments() async {
    final documents = await _filePickerHelper.pickDocuments();
    return addDocuments(documents);
  }

  int addDocuments(List<PlatformFile> documents) {
    final validDocuments = documents.where(
      (document) => document.isValidDocument,
    );
    final rejectedDocuments = documents.length - validDocuments.length;

    if (validDocuments.isNotEmpty) {
      emit(state.copyWith(documents: [...state.documents, ...validDocuments]));
    }

    return rejectedDocuments;
  }

  void removeDocument(PlatformFile document) {
    final documents = List<PlatformFile>.of(state.documents)..remove(document);
    emit(state.copyWith(documents: documents));
  }
}
