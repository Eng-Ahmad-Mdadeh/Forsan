import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'legal_page_model.g.dart';

@JsonSerializable(createToJson: false)
class LegalPageModel extends Equatable {
  LegalPageModel({
    required this.slug,
    required this.title,
    required this.updatedAt,
    required this.sections,
  });

  final String? slug;
  final String? title;
  final DateTime? updatedAt;
  final List<Section>? sections;

  factory LegalPageModel.fromJson(Map<String, dynamic> json) => _$LegalPageModelFromJson(json);

  @override
  List<Object?> get props => [
    slug, title, updatedAt, sections, ];
}

@JsonSerializable(createToJson: false)
class Section extends Equatable {
  Section({
    required this.number,
    required this.title,
    required this.body,
  });

  final int? number;
  final String? title;
  final String? body;

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);

  @override
  List<Object?> get props => [
    number, title, body, ];
}
