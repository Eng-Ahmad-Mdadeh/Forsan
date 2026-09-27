part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class Step extends Equatable {
  Step({
    required this.title,
    required this.number,
    required this.sections,
  });

  final String? title;
  final int? number;
  final List<Section>? sections;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  @override
  List<Object?> get props => [
    title, number, sections, ];
}
