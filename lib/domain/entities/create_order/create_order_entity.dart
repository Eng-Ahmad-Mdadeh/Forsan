import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class CreateOrderEntity extends Equatable {
  const CreateOrderEntity({
    this.serviceSlug,
    this.formValues = const {},
    this.currentStep = 0,
    this.documents = const [],
  });

  final String? serviceSlug;
  final Map<String, dynamic> formValues;
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
    int? currentStep,
    List<PlatformFile>? documents,
  }) {
    return CreateOrderEntity(
      serviceSlug: serviceSlug ?? this.serviceSlug,
      formValues: formValues ?? this.formValues,
      currentStep: currentStep ?? this.currentStep,
      documents: documents ?? this.documents,
    );
  }

  @override
  List<Object?> get props => [
    serviceSlug,
    formValues,
    currentStep,
    documents,
  ];
}
