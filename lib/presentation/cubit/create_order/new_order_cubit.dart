import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:forsan/presentation/cubit/create_order/new_order_state.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  NewOrderCubit() : super(const NewOrderState());

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

  void addDocuments(List<PlatformFile> documents) {
    if (documents.isEmpty) return;

    emit(state.copyWith(documents: [...state.documents, ...documents]));
  }

  void removeDocument(PlatformFile document) {
    final documents = List<PlatformFile>.of(state.documents)..remove(document);
    emit(state.copyWith(documents: documents));
  }
}
