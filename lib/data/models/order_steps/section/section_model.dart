part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class Section extends Equatable {
  Section({
    required this.id,
    required this.title,
    required this.fields,
    required this.description,
  });

  final String? id;
  final String? title;
  final List<SectionField>? fields;
  final String? description;

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  @override
  List<Object?> get props => [id, title, fields, description];
}
