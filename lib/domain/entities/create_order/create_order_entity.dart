import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class CreateOrderEntity extends Equatable {
  const CreateOrderEntity({
    this.serviceSlug,
    this.formValues = const {},
    this.establishmentType = 'one_person',
    this.applicantType = ' ',
    this.currentStep = 0,
    this.documents = const [],
  });

  final String? serviceSlug;
  final Map<String, dynamic> formValues;
  final String establishmentType;
  final String applicantType;
  final int currentStep;
  final List<PlatformFile> documents;

  Map<String, dynamic> toJson() {
    return {
      if (serviceSlug != null && serviceSlug!.isNotEmpty) 'slug': serviceSlug,
      if (formValues.isNotEmpty) 'formData': formValues,
    };
  }

  CreateOrderEntity copyWith({
    String? serviceSlug,
    Map<String, dynamic>? formValues,
    String? establishmentType,
    String? applicantType,
    int? currentStep,
    List<PlatformFile>? documents,
  }) {
    return CreateOrderEntity(
      serviceSlug: serviceSlug ?? this.serviceSlug,
      formValues: formValues ?? this.formValues,
      establishmentType: establishmentType ?? this.establishmentType,
      applicantType: applicantType ?? this.applicantType,
      currentStep: currentStep ?? this.currentStep,
      documents: documents ?? this.documents,
    );
  }

  @override
  List<Object?> get props => [
    serviceSlug,
    formValues,
    establishmentType,
    applicantType,
    currentStep,
    documents,
  ];
}
