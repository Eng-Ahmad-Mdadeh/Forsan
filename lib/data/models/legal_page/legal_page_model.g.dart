// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegalPageModel _$LegalPageModelFromJson(Map<String, dynamic> json) =>
    LegalPageModel(
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
  number: (json['number'] as num?)?.toInt(),
  title: json['title'] as String?,
  body: json['body'] as String?,
);
