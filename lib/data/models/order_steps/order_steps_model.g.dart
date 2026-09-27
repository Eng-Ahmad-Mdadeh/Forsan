// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_steps_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStepsModel _$OrderStepsModelFromJson(Map<String, dynamic> json) =>
    OrderStepsModel(
      serviceSlug: json['serviceSlug'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: (json['version'] as num?)?.toInt(),
      agreements: (json['agreements'] as List<dynamic>?)
          ?.map((e) => Agreement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Agreement _$AgreementFromJson(Map<String, dynamic> json) =>
    Agreement(id: json['id'] as String?, label: json['label'] as String?);

Step _$StepFromJson(Map<String, dynamic> json) => Step(
  title: json['title'] as String?,
  number: (json['number'] as num?)?.toInt(),
  sections: (json['sections'] as List<dynamic>?)
      ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
  id: json['id'] as String?,
  title: json['title'] as String?,
  fields: (json['fields'] as List<dynamic>?)
      ?.map((e) => SectionField.fromJson(e as Map<String, dynamic>))
      .toList(),
  description: json['description'] as String?,
);

SectionField _$SectionFieldFromJson(Map<String, dynamic> json) => SectionField(
  id: json['id'] as String?,
  type: json['type'] as String?,
  label: json['label'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => FluffyOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  required: json['required'] as bool?,
  placeholder: json['placeholder'] as String?,
  hint: json['hint'] as String?,
  visibleIf: json['visibleIf'] == null
      ? null
      : VisibleIf.fromJson(json['visibleIf'] as Map<String, dynamic>),
  validation: json['validation'] == null
      ? null
      : FluffyValidation.fromJson(json['validation'] as Map<String, dynamic>),
  fields: (json['fields'] as List<dynamic>?)
      ?.map((e) => FieldField.fromJson(e as Map<String, dynamic>))
      .toList(),
);

FieldField _$FieldFieldFromJson(Map<String, dynamic> json) => FieldField(
  id: json['id'] as String?,
  type: json['type'] as String?,
  label: json['label'] as String?,
  required: json['required'] as bool?,
  placeholder: json['placeholder'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => PurpleOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  validation: json['validation'] == null
      ? null
      : PurpleValidation.fromJson(json['validation'] as Map<String, dynamic>),
);

PurpleOption _$PurpleOptionFromJson(Map<String, dynamic> json) => PurpleOption(
  label: json['label'] as String?,
  value: json['value'] as String?,
);

FluffyOption _$FluffyOptionFromJson(Map<String, dynamic> json) => FluffyOption(
  label: json['label'] as String?,
  value: json['value'] as String?,
  description: json['description'] as String?,
);

PurpleValidation _$PurpleValidationFromJson(Map<String, dynamic> json) =>
    PurpleValidation(
      max: (json['max'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toInt(),
    );

FluffyValidation _$FluffyValidationFromJson(Map<String, dynamic> json) =>
    FluffyValidation(
      max: (json['max'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toInt(),
      maxItems: (json['maxItems'] as num?)?.toInt(),
      minItems: (json['minItems'] as num?)?.toInt(),
      maxSize: (json['maxSize'] as num?)?.toInt(),
      acceptedTypes: (json['acceptedTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

VisibleIf _$VisibleIfFromJson(Map<String, dynamic> json) => VisibleIf(
  visibleIfIn: (json['visibleIfIn'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  field: json['field'] as String?,
);
