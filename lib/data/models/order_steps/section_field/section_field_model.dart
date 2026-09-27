part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class SectionField extends Equatable {
  SectionField({
    required this.id,
    required this.type,
    required this.label,
    required this.options,
    required this.required,
    required this.placeholder,
    required this.hint,
    required this.visibleIf,
    required this.validation,
    required this.fields,
  });

  final String? id;
  final String? type;
  final String? label;
  final List<FluffyOption>? options;
  final bool? required;
  final String? placeholder;
  final String? hint;
  final VisibleIf? visibleIf;
  final FluffyValidation? validation;
  final List<FieldField>? fields;

  factory SectionField.fromJson(Map<String, dynamic> json) =>
      _$SectionFieldFromJson(json);

  @override
  List<Object?> get props => [
    id,
    type,
    label,
    options,
    required,
    placeholder,
    hint,
    visibleIf,
    validation,
    fields,
  ];
}
