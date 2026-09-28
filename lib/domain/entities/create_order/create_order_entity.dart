import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class CreateOrderEntity extends Equatable {
  const CreateOrderEntity({
    this.serviceSlug,
    this.slug,
    this.orderId,
    this.formValues = const {},
    this.currentStep = 0,
    this.requirementDocuments = const {},
  });

  final String? serviceSlug;
  final String? slug;
  final String? orderId;
  final Map<String, dynamic> formValues;
  final int currentStep;
  final Map<String, PlatformFile> requirementDocuments;

  Map<String, dynamic> toJson() {
    return {
      if (slug != null && slug!.isNotEmpty) 'slug': slug,
      if (serviceSlug != null && serviceSlug!.isNotEmpty)
        'serviceSlug': serviceSlug,
      if (formValues.isNotEmpty) 'formData': formValues,
    };
  }

  CreateOrderEntity copyWith({
    String? serviceSlug,
    String? slug,
    Map<String, dynamic>? formValues,
    int? currentStep,
    String? orderId,
    Map<String, PlatformFile>? requirementDocuments,
  }) {
    return CreateOrderEntity(
      serviceSlug: serviceSlug ?? this.serviceSlug,
      slug: slug ?? this.slug,
      orderId: orderId ?? this.orderId,
      formValues: formValues ?? this.formValues,
      currentStep: currentStep ?? this.currentStep,
      requirementDocuments: requirementDocuments ?? this.requirementDocuments,
    );
  }

  @override
  List<Object?> get props => [
    serviceSlug,
    formValues,
    currentStep,
    orderId,
    slug,
    requirementDocuments,
  ];
}
