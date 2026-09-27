part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class FieldField extends Equatable {
  FieldField({
    required this.id,
    required this.type,
    required this.label,
    required this.required,
    required this.placeholder,
    required this.options,
    required this.validation,
  });

  final String? id;
  final String? type;
  final String? label;
  final bool? required;
  final String? placeholder;
  final List<PurpleOption>? options;
  final PurpleValidation? validation;

  factory FieldField.fromJson(Map<String, dynamic> json) =>
      _$FieldFieldFromJson(json);

  @override
  List<Object?> get props => [
    id,
    type,
    label,
    required,
    placeholder,
    options,
    validation,
  ];
}
