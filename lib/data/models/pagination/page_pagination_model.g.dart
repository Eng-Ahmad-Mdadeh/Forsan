// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagePaginationModel<T> _$PagePaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PagePaginationModel<T>(
  items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
  page: (json['page'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);
