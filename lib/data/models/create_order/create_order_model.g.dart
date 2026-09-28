// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderModel _$CreateOrderModelFromJson(Map<String, dynamic> json) =>
    CreateOrderModel(
      id: json['id'] as String?,
      reference: json['reference'] as String?,
      status: json['status'] as String?,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      serviceSlug: json['serviceSlug'] as String?,
      currentStep: (json['currentStep'] as num?)?.toInt(),
      totalSteps: (json['totalSteps'] as num?)?.toInt(),
      formData: json['formData'] == null
          ? null
          : FormData.fromJson(json['formData'] as Map<String, dynamic>),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
);

FileElement _$FileElementFromJson(Map<String, dynamic> json) => FileElement(
  id: json['id'] as String?,
  name: json['name'] as String?,
  mimeType: json['mimeType'] as String?,
  size: (json['size'] as num?)?.toInt(),
  source: json['source'] as String?,
  kind: json['kind'] as String?,
  status: json['status'] as String?,
  locked: json['locked'] as bool?,
  lockReason: json['lockReason'],
  uploadedAt: json['uploadedAt'] == null
      ? null
      : DateTime.parse(json['uploadedAt'] as String),
  downloadUrl: json['downloadUrl'] as String?,
  fieldId: json['fieldId'] as String?,
);

FormData _$FormDataFromJson(Map<String, dynamic> json) => FormData(
  city: json['city'] as String?,
  email: json['email'] as String?,
  fullName: json['fullName'] as String?,
  partners: (json['partners'] as List<dynamic>?)
      ?.map((e) => Partner.fromJson(e as Map<String, dynamic>))
      .toList(),
  fatherName: json['fatherName'] as String?,
  nationalId: json['nationalId'] as String?,
  description: json['description'] as String?,
  governorate: json['governorate'] as String?,
  nationality: json['nationality'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  mainActivity: json['mainActivity'] as String?,
  applicantType: json['applicantType'] as String?,
  currentCountry: json['currentCountry'] as String?,
  suggestedName1: json['suggestedName1'] as String?,
  applicantStatus: json['applicantStatus'] as String?,
  hasHeadquarters: json['hasHeadquarters'] as String?,
  mainPartnerName: json['mainPartnerName'] as String?,
  requiresLicense: json['requiresLicense'] as String?,
  numberOfPartners: json['numberOfPartners'] as String?,
  establishmentType: json['establishmentType'] as String?,
  mainPartnerNationality: json['mainPartnerNationality'] as String?,
  mainPartnerContributionType: json['mainPartnerContributionType'] as String?,
);

Partner _$PartnerFromJson(Map<String, dynamic> json) =>
    Partner(fullName: json['fullName'] as String?);
