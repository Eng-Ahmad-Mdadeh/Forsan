import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class CreateOrderEntity extends Equatable {
  const CreateOrderEntity({
    this.acknowledgesAccuracy,
    this.acceptsTerms,
    this.serviceSlug,
    this.slug,
    this.orderId,
    this.fileId,
    this.formValues = const {},
    this.currentStep = 0,
    this.requirementDocuments = const {},
  });

  final String? serviceSlug;
  final bool? acknowledgesAccuracy;
  final bool? acceptsTerms;
  final String? slug;
  final String? orderId;
  final String? fileId;
  final Map<String, dynamic> formValues;
  final int currentStep;
  final Map<String, PlatformFile> requirementDocuments;

  Map<String, dynamic> toCreateJson() => {'serviceSlug': serviceSlug};

  Map<String, dynamic> toUpdateJson() => {
    'formData': formValues,
    'currentStep': currentStep + 1,
  };

  Map<String, dynamic> toSubmitJson() => {
    'agreements': {
      'acknowledgesAccuracy': acknowledgesAccuracy,
      'acceptsTerms': acceptsTerms,
    },
  };

  CreateOrderEntity copyWith({
    String? serviceSlug,
    String? slug,
    Map<String, dynamic>? formValues,
    int? currentStep,
    String? orderId,
    bool? acknowledgesAccuracy,
    bool? acceptsTerms,
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
      acknowledgesAccuracy: acknowledgesAccuracy ?? this.acknowledgesAccuracy,
      acceptsTerms: acceptsTerms ?? this.acceptsTerms,
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
    acknowledgesAccuracy,
    acceptsTerms,
  ];
}
