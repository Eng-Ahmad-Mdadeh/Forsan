part of '../order_steps_model.dart';

@JsonSerializable(createToJson: false)
class VisibleIf extends Equatable {
  VisibleIf({required this.visibleIfIn, required this.field});

  @JsonKey(name: 'in')
  final List<String>? visibleIfIn;
  final String? field;

  factory VisibleIf.fromJson(Map<String, dynamic> json) =>
      _$VisibleIfFromJson(json);

  @override
  List<Object?> get props => [visibleIfIn, field];
}
