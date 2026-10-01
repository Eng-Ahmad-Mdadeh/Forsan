part of '../document_details_model.dart';

@JsonSerializable(createToJson: false)
class RequiredActionModel extends Equatable {
  RequiredActionModel({
    required this.type,
    required this.requestId,
    required this.reference,
    required this.title,
    required this.message,
    required this.actionLabel,
  });

  final String? type;
  final String? requestId;
  final String? reference;
  final String? title;
  final String? message;
  final String? actionLabel;

  factory RequiredActionModel.fromJson(Map<String, dynamic> json) => _$RequiredActionModelFromJson(json);

  @override
  List<Object?> get props => [
    type, requestId, reference, title, message, actionLabel, ];
}
