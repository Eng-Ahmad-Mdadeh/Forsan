import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'step/step_model.dart';

part 'order_steps_model.g.dart';
part 'step/step_model.dart';

@JsonSerializable(createToJson: false)
class OrderStepsModel extends Equatable {
  OrderStepsModel({
    required this.serviceSlug,
    required this.steps,
    required this.version,
    required this.agreements,
  });

  final String? serviceSlug;
  final List<Step>? steps;
  final int? version;
  final List<Agreement>? agreements;

  factory OrderStepsModel.fromJson(Map<String, dynamic> json) => _$OrderStepsModelFromJson(json);

  @override
  List<Object?> get props => [
    serviceSlug, steps, version, agreements, ];
}

@JsonSerializable(createToJson: false)
class Agreement extends Equatable {
  Agreement({
    required this.id,
    required this.label,
  });

  final String? id;
  final String? label;

  factory Agreement.fromJson(Map<String, dynamic> json) => _$AgreementFromJson(json);

  @override
  List<Object?> get props => [
    id, label, ];
}

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

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);

  @override
  List<Object?> get props => [
    id, title, fields, description, ];
}

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

  factory SectionField.fromJson(Map<String, dynamic> json) => _$SectionFieldFromJson(json);

  @override
  List<Object?> get props => [
    id, type, label, options, required, placeholder, hint, visibleIf, validation, fields, ];
}

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

  factory FieldField.fromJson(Map<String, dynamic> json) => _$FieldFieldFromJson(json);

  @override
  List<Object?> get props => [
    id, type, label, required, placeholder, options, validation, ];
}

@JsonSerializable(createToJson: false)
class PurpleOption extends Equatable {
  PurpleOption({
    required this.label,
    required this.value,
  });

  final String? label;
  final String? value;

  factory PurpleOption.fromJson(Map<String, dynamic> json) => _$PurpleOptionFromJson(json);

  @override
  List<Object?> get props => [
    label, value, ];
}

@JsonSerializable(createToJson: false)
class PurpleValidation extends Equatable {
  PurpleValidation({
    required this.max,
    required this.min,
  });

  final int? max;
  final int? min;

  factory PurpleValidation.fromJson(Map<String, dynamic> json) => _$PurpleValidationFromJson(json);

  @override
  List<Object?> get props => [
    max, min, ];
}

@JsonSerializable(createToJson: false)
class FluffyOption extends Equatable {
  FluffyOption({
    required this.label,
    required this.value,
    required this.description,
  });

  final String? label;
  final String? value;
  final String? description;

  factory FluffyOption.fromJson(Map<String, dynamic> json) => _$FluffyOptionFromJson(json);

  @override
  List<Object?> get props => [
    label, value, description, ];
}

@JsonSerializable(createToJson: false)
class FluffyValidation extends Equatable {
  FluffyValidation({
    required this.max,
    required this.min,
    required this.maxItems,
    required this.minItems,
    required this.maxSize,
    required this.acceptedTypes,
  });

  final int? max;
  final int? min;
  final int? maxItems;
  final int? minItems;
  final int? maxSize;
  final List<String>? acceptedTypes;

  factory FluffyValidation.fromJson(Map<String, dynamic> json) => _$FluffyValidationFromJson(json);

  @override
  List<Object?> get props => [
    max, min, maxItems, minItems, maxSize, acceptedTypes, ];
}

@JsonSerializable(createToJson: false)
class VisibleIf extends Equatable {
  VisibleIf({
    required this.visibleIfIn,
    required this.field,
  });

  final List<String>? visibleIfIn;
  final String? field;

  factory VisibleIf.fromJson(Map<String, dynamic> json) => _$VisibleIfFromJson(json);

  @override
  List<Object?> get props => [
    visibleIfIn, field, ];
}
