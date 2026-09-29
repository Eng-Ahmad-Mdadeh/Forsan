import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_order_model.g.dart';

@JsonSerializable(createToJson: false)
class CreateOrderModel extends Equatable {
  CreateOrderModel({
    required this.id,
    required this.reference,
    required this.status,
    required this.customer,
    required this.serviceSlug,
    required this.currentStep,
    required this.totalSteps,
    required this.formData,
    required this.files,
    required this.updatedAt,
  });

  final String? id;
  final String? reference;
  final String? status;
  final Customer? customer;
  final String? serviceSlug;
  final int? currentStep;
  final int? totalSteps;
  final Map<String, dynamic>? formData;
  final List<FileElement>? files;
  final DateTime? updatedAt;

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) => _$CreateOrderModelFromJson(json);

  @override
  List<Object?> get props => [
    id, reference, status, customer, serviceSlug, currentStep, totalSteps, formData, files, updatedAt, ];
}

@JsonSerializable(createToJson: false)
class Customer extends Equatable {
  Customer({
    required this.id,
    required this.fullName,
    required this.phone,
  });

  final String? id;
  final String? fullName;
  final String? phone;

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  @override
  List<Object?> get props => [
    id, fullName, phone, ];
}

@JsonSerializable(createToJson: false)
class FileElement extends Equatable {
  FileElement({
    required this.id,
    required this.name,
    required this.mimeType,
    required this.size,
    required this.source,
    required this.kind,
    required this.status,
    required this.locked,
    required this.lockReason,
    required this.uploadedAt,
    required this.downloadUrl,
    required this.fieldId,
  });

  final String? id;
  final String? name;
  final String? mimeType;
  final int? size;
  final String? source;
  final String? kind;
  final String? status;
  final bool? locked;
  final dynamic lockReason;
  final DateTime? uploadedAt;
  final String? downloadUrl;
  final String? fieldId;

  factory FileElement.fromJson(Map<String, dynamic> json) => _$FileElementFromJson(json);

  @override
  List<Object?> get props => [
    id, name, mimeType, size, source, kind, status, locked, lockReason, uploadedAt, downloadUrl, fieldId, ];
}

@JsonSerializable(createToJson: false)
class FormData extends Equatable {
  FormData({
    required this.city,
    required this.email,
    required this.fullName,
    required this.partners,
    required this.fatherName,
    required this.nationalId,
    required this.description,
    required this.governorate,
    required this.nationality,
    required this.phoneNumber,
    required this.mainActivity,
    required this.applicantType,
    required this.currentCountry,
    required this.suggestedName1,
    required this.applicantStatus,
    required this.hasHeadquarters,
    required this.mainPartnerName,
    required this.requiresLicense,
    required this.numberOfPartners,
    required this.establishmentType,
    required this.mainPartnerNationality,
    required this.mainPartnerContributionType,
  });

  final String? city;
  final String? email;
  final String? fullName;
  final List<Partner>? partners;
  final String? fatherName;
  final String? nationalId;
  final String? description;
  final String? governorate;
  final String? nationality;
  final String? phoneNumber;
  final String? mainActivity;
  final String? applicantType;
  final String? currentCountry;
  final String? suggestedName1;
  final String? applicantStatus;
  final String? hasHeadquarters;
  final String? mainPartnerName;
  final String? requiresLicense;
  final String? numberOfPartners;
  final String? establishmentType;
  final String? mainPartnerNationality;
  final String? mainPartnerContributionType;

  factory FormData.fromJson(Map<String, dynamic> json) => _$FormDataFromJson(json);

  @override
  List<Object?> get props => [
    city, email, fullName, partners, fatherName, nationalId, description, governorate, nationality, phoneNumber, mainActivity, applicantType, currentCountry, suggestedName1, applicantStatus, hasHeadquarters, mainPartnerName, requiresLicense, numberOfPartners, establishmentType, mainPartnerNationality, mainPartnerContributionType, ];
}

@JsonSerializable(createToJson: false)
class Partner extends Equatable {
  Partner({
    required this.fullName,
  });

  final String? fullName;

  factory Partner.fromJson(Map<String, dynamic> json) => _$PartnerFromJson(json);

  @override
  List<Object?> get props => [
    fullName, ];
}
