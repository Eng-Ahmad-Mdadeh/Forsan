// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListModel _$OrderListModelFromJson(Map<String, dynamic> json) =>
    OrderListModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      counts: json['counts'] == null
          ? null
          : Counts.fromJson(json['counts'] as Map<String, dynamic>),
    );

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
