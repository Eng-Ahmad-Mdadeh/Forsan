// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsModel _$OrderDetailsModelFromJson(Map<String, dynamic> json) =>
    OrderDetailsModel(
      id: json['id'] as String?,
      reference: json['reference'] as String?,
      serviceSlug: json['serviceSlug'] as String?,
      serviceName: json['serviceName'] as String?,
      categoryName: json['categoryName'] as String?,
      status: json['status'] as String?,
      displayStatus: json['displayStatus'] as String?,
      statusLabel: json['statusLabel'] as String?,
      progress: (json['progress'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      consultant: json['consultant'] == null
          ? null
          : Consultant.fromJson(json['consultant'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      applicantName: json['applicantName'] as String?,
      applicantType: json['applicantType'] == null
          ? null
          : ApplicantType.fromJson(
              json['applicantType'] as Map<String, dynamic>,
            ),
      requiredAction: json['requiredAction'],
      payment: json['payment'] == null
          ? null
          : Payment.fromJson(json['payment'] as Map<String, dynamic>),
      stages: (json['stages'] as List<dynamic>?)
          ?.map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredDocuments: (json['requiredDocuments'] as List<dynamic>?)
          ?.map((e) => RequiredDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      uploads: (json['uploads'] as List<dynamic>?)
          ?.map((e) => Upload.fromJson(e as Map<String, dynamic>))
          .toList(),
      actions: json['actions'] == null
          ? null
          : Actions.fromJson(json['actions'] as Map<String, dynamic>),
    );

ApplicantType _$ApplicantTypeFromJson(Map<String, dynamic> json) =>
    ApplicantType(
      fieldId: json['fieldId'] as String?,
      value: json['value'] as String?,
      label: json['label'] as String?,
    );

Consultant _$ConsultantFromJson(Map<String, dynamic> json) => Consultant(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  avatarUrl: json['avatarUrl'],
);

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
  total: json['total'],
  paid: json['paid'] == null
      ? null
      : Paid.fromJson(json['paid'] as Map<String, dynamic>),
  remaining: json['remaining'] == null
      ? null
      : Paid.fromJson(json['remaining'] as Map<String, dynamic>),
  status: json['status'] as String?,
);

Paid _$PaidFromJson(Map<String, dynamic> json) => Paid(
  amount: json['amount'] as String?,
  currency: json['currency'] as String?,
);

RequiredDocument _$RequiredDocumentFromJson(Map<String, dynamic> json) =>
    RequiredDocument(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'],
      status: json['status'] as String?,
      statusLabel: json['statusLabel'] as String?,
      rejectionReason: json['rejectionReason'],
      acceptedTypes: (json['acceptedTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maxSize: (json['maxSize'] as num?)?.toInt(),
      file: json['file'] == null
          ? null
          : Attachment.fromJson(json['file'] as Map<String, dynamic>),
    );

Stage _$StageFromJson(Map<String, dynamic> json) => Stage(
  key: json['key'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  state: json['state'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
  id: json['id'] as String?,
  fullName: json['fullName'] as String?,
  phone: json['phone'] as String?,
);

Actions _$ActionsFromJson(Map<String, dynamic> json) => Actions(
  canAcceptQuote: json['canAcceptQuote'] as bool?,
  canPay: json['canPay'] as bool?,
  canUploadDocuments: json['canUploadDocuments'] as bool?,
  canChat: json['canChat'] as bool?,
);

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
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
);

Upload _$UploadFromJson(Map<String, dynamic> json) => Upload(
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
  statusLabel: json['statusLabel'] as String?,
  rejectionReason: json['rejectionReason'],
  fieldId: json['fieldId'] as String?,
  fieldLabel: json['fieldLabel'] as String?,
);
