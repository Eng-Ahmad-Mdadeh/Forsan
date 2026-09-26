part of '../order_details_model.dart';

@JsonSerializable(createToJson: false)
class Stage extends Equatable {
  Stage({
    required this.key,
    required this.title,
    required this.description,
    required this.state,
    required this.date,
  });

  final String? key;
  final String? title;
  final String? description;
  final String? state;
  final DateTime? date;

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);

  @override
  List<Object?> get props => [
    key, title, description, state, date, ];
}
