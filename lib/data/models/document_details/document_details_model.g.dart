// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentDetailsModel _$DocumentDetailsModelFromJson(
  Map<String, dynamic> json,
) => DocumentDetailsModel(
  requiredAction: json['requiredAction'],
  requiredDocuments: json['requiredDocuments'] as List<dynamic>?,
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  uploads: (json['uploads'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
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
  lockReason: json['lockReason'] as String?,
  uploadedAt: json['uploadedAt'] == null
      ? null
      : DateTime.parse(json['uploadedAt'] as String),
  downloadUrl: json['downloadUrl'] as String?,
);
