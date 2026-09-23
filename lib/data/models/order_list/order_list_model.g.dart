// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Counts _$CountsFromJson(Map<String, dynamic> json) => Counts(
  all: (json['all'] as num?)?.toInt(),
  underReview: (json['UNDER_REVIEW'] as num?)?.toInt(),
);

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  id: json['id'] as String?,
  reference: json['reference'] as String?,
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
);
