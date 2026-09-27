part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class StepModel extends Equatable {
  StepModel({
    required this.title,
    required this.number,
    required this.sections,
  });

  final String? title;
  final int? number;
  final List<Section>? sections;

  factory StepModel.fromJson(Map<String, dynamic> json) => _$StepModelFromJson(json);

  @override
  List<Object?> get props => [
    title, number, sections, ];
}
