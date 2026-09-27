import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_steps_model.g.dart';
part 'agreement/agreement_model.dart';
part 'step/step_model.dart';
part 'section/section_model.dart';
part 'section_field/section_field_model.dart';
part 'field_field/field_field_model.dart';
part 'purple_option/purple_option_model.dart';
part 'fluffy_option/fluffy_option_model.dart';
part 'purple_validation/purple_validation_model.dart';
part 'fluffy_validation/fluffy_validation_model.dart';
part 'visible_if/visible_if_model.dart';

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

  factory OrderStepsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStepsModelFromJson(json);

  @override
  List<Object?> get props => [serviceSlug, steps, version, agreements];
}
