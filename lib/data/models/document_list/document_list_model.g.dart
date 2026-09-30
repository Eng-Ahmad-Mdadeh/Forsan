// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentListModel _$DocumentListModelFromJson(Map<String, dynamic> json) =>
    DocumentListModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
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
  consultant: json['consultant'],
  documentsStatus: json['documentsStatus'] as String?,
  documentsStatusLabel: json['documentsStatusLabel'] as String?,
  requiredCount: (json['requiredCount'] as num?)?.toInt(),
  attachmentCount: (json['attachmentCount'] as num?)?.toInt(),
);
