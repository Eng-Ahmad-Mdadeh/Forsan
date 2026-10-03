import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_details_model.g.dart';
part 'stage/stage_model.dart';
part 'customer/customer_model.dart';
part 'actions/actions_model.dart';

@JsonSerializable(createToJson: false)
class OrderDetailsModel extends Equatable {
  OrderDetailsModel({
    required this.id,
    required this.reference,
    required this.serviceSlug,
    required this.serviceName,
    required this.categoryName,
    required this.status,
    required this.displayStatus,
    required this.statusLabel,
    required this.progress,
    required this.createdAt,
    required this.consultant,
    required this.customer,
    required this.applicantName,
    required this.applicantType,
    required this.requiredAction,
    required this.payment,
    required this.stages,
    required this.requiredDocuments,
    required this.attachments,
    required this.actions,
  });

  final String? id;
  final String? reference;
  final String? serviceSlug;
  final String? serviceName;
  final String? categoryName;
  final String? status;
  final String? displayStatus;
  final String? statusLabel;
  final int? progress;
  final DateTime? createdAt;
  final Consultant? consultant;
  final Customer? customer;
  final String? applicantName;
  final ApplicantType? applicantType;
  final dynamic requiredAction;
  final Payment? payment;
  final List<Stage>? stages;
  final List<RequiredDocument>? requiredDocuments;
  final List<Attachment>? attachments;
  final Actions? actions;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => _$OrderDetailsModelFromJson(json);

  @override
  List<Object?> get props => [
    id, reference, serviceSlug, serviceName, categoryName, status, displayStatus, statusLabel, progress, createdAt, consultant, customer, applicantName, applicantType, requiredAction, payment, stages, requiredDocuments, attachments, actions, ];
}


@JsonSerializable(createToJson: false)
class ApplicantType extends Equatable {
  ApplicantType({
    required this.fieldId,
    required this.value,
    required this.label,
  });

  final String? fieldId;
  final String? value;
  final String? label;

  factory ApplicantType.fromJson(Map<String, dynamic> json) => _$ApplicantTypeFromJson(json);

  @override
  List<Object?> get props => [
    fieldId, value, label, ];
}

@JsonSerializable(createToJson: false)
class Attachment extends Equatable {
  Attachment({
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

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);

  @override
  List<Object?> get props => [
    id, name, mimeType, size, source, kind, status, locked, lockReason, uploadedAt, downloadUrl, ];
}

@JsonSerializable(createToJson: false)
class Consultant extends Equatable {
  Consultant({
    required this.id,
    required this.fullName,
    required this.avatarUrl,
  });

  final String? id;
  final String? fullName;
  final dynamic avatarUrl;

  factory Consultant.fromJson(Map<String, dynamic> json) => _$ConsultantFromJson(json);

  @override
  List<Object?> get props => [
    id, fullName, avatarUrl, ];
}



@JsonSerializable(createToJson: false)
class Payment extends Equatable {
  Payment({
    required this.total,
    required this.paid,
    required this.remaining,
    required this.status,
  });

  final dynamic total;
  final Paid? paid;
  final Paid? remaining;
  final String? status;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  @override
  List<Object?> get props => [
    total, paid, remaining, status, ];
}

@JsonSerializable(createToJson: false)
class Paid extends Equatable {
  Paid({
    required this.amount,
    required this.currency,
  });

  final String? amount;
  final String? currency;

  factory Paid.fromJson(Map<String, dynamic> json) => _$PaidFromJson(json);

  @override
  List<Object?> get props => [
    amount, currency, ];
}

@JsonSerializable(createToJson: false)
class RequiredDocument extends Equatable {
  RequiredDocument({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.statusLabel,
    required this.rejectionReason,
    required this.acceptedTypes,
    required this.maxSize,
    required this.file,
  });

  final String? id;
  final String? name;
  final dynamic description;
  final String? status;
  final String? statusLabel;
  final dynamic rejectionReason;
  final List<String>? acceptedTypes;
  final int? maxSize;
  final Attachment? file;

  factory RequiredDocument.fromJson(Map<String, dynamic> json) => _$RequiredDocumentFromJson(json);

  @override
  List<Object?> get props => [
    id, name, description, status, statusLabel, rejectionReason, acceptedTypes, maxSize, file, ];
}

