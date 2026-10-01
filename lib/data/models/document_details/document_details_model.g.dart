// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentDetailsModel _$DocumentDetailsModelFromJson(
  Map<String, dynamic> json,
) => DocumentDetailsModel(
  requiredAction: json['requiredAction'] == null
      ? null
      : RequiredActionModel.fromJson(
          json['requiredAction'] as Map<String, dynamic>,
        ),
  requiredDocuments: (json['requiredDocuments'] as List<dynamic>?)
      ?.map((e) => RequiredDocumentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  uploads: (json['uploads'] as List<dynamic>?)
      ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

AttachmentModel _$AttachmentModelFromJson(Map<String, dynamic> json) =>
    AttachmentModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      mimeType: json['mimeType'] as String?,
      size: (json['size'] as num?)?.toInt(),
      source: json['source'] as String?,
      kind: json['kind'] as String?,
      status: json['status'] as String?,
      locked: json['locked'] as bool?,
      lockReason: json['lockReason'] as String?,
      uploadedAt: json['uploadedAt'] == null
          ? null
          : DateTime.parse(json['uploadedAt'] as String),
      downloadUrl: json['downloadUrl'] as String?,
    );

RequiredActionModel _$RequiredActionModelFromJson(Map<String, dynamic> json) =>
    RequiredActionModel(
      type: json['type'] as String?,
      requestId: json['requestId'] as String?,
      reference: json['reference'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      actionLabel: json['actionLabel'] as String?,
    );

RequiredDocumentModel _$RequiredDocumentModelFromJson(
  Map<String, dynamic> json,
) => RequiredDocumentModel(
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
  file: json['file'],
);
