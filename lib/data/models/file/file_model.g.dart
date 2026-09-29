// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) => FileModel(
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
