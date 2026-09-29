import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class CreateOrderEntity extends Equatable {
  const CreateOrderEntity({
    this.serviceSlug,
    this.slug,
    this.orderId,
    this.fileId,
    this.formValues = const {},
    this.currentStep = 0,
    this.requirementDocuments = const {},
  });

  final String? serviceSlug;
  final String? slug;
  final String? orderId;
  final String? fileId;
  final Map<String, dynamic> formValues;
  final int currentStep;
  final Map<String, PlatformFile> requirementDocuments;

  Map<String, dynamic> toCreateJson() => {'serviceSlug': serviceSlug};

  Map<String, dynamic> toUpdateJson() => {
    'formData': formValues,
    // Form pages are zero-based locally, while the API numbers them from one.
    'currentStep': currentStep + 1,
  };

  CreateOrderEntity copyWith({
    String? serviceSlug,
    String? slug,
    Map<String, dynamic>? formValues,
    int? currentStep,
    String? orderId,
    String? fileId,
    Map<String, PlatformFile>? requirementDocuments,
  }) {
    return CreateOrderEntity(
      serviceSlug: serviceSlug ?? this.serviceSlug,
      slug: slug ?? this.slug,
      orderId: orderId ?? this.orderId,
      fileId: fileId ?? this.fileId,
      formValues: formValues ?? this.formValues,
      currentStep: currentStep ?? this.currentStep,
      requirementDocuments: requirementDocuments ?? this.requirementDocuments,
    );
  }

  @override
  List<Object?> get props => [
    serviceSlug,
    fileId,
    formValues,
    currentStep,
    orderId,
    slug,
    requirementDocuments,
  ];
}
