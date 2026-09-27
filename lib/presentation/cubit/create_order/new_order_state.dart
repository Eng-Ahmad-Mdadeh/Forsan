import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class NewOrderState extends Equatable {
  const NewOrderState({
    this.currentStep = 0,
    this.establishmentType = 'one_person',
    this.applicantType = ' ',
    this.documents = const [],
    this.formValues = const {},
  });

  final int currentStep;
  final String establishmentType;
  final String applicantType;
  final List<PlatformFile> documents;
  final Map<String, dynamic> formValues;

  NewOrderState copyWith({
    int? currentStep,
    String? establishmentType,
    String? applicantType,
    List<PlatformFile>? documents,
    Map<String, dynamic>? formValues,
  }) {
    return NewOrderState(
      currentStep: currentStep ?? this.currentStep,
      establishmentType: establishmentType ?? this.establishmentType,
      applicantType: applicantType ?? this.applicantType,
      documents: documents ?? this.documents,
      formValues: formValues ?? this.formValues,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        establishmentType,
        applicantType,
        documents,
        formValues,
      ];
}
