part of '../document_details_model.dart';

@JsonSerializable(createToJson: false)
class RequiredDocumentModel extends Equatable {
  RequiredDocumentModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.statusLabel,
    required this.rejectionReason,
    required this.acceptedTypes,
    required this.maxSize,
    required this.file,
  });

  final String? id;
  final String? name;
  final dynamic description;
  final String? status;
  final String? statusLabel;
  final dynamic rejectionReason;
  final List<String>? acceptedTypes;
  final int? maxSize;
  final dynamic file;

  factory RequiredDocumentModel.fromJson(Map<String, dynamic> json) => _$RequiredDocumentModelFromJson(json);

  @override
  List<Object?> get props => [
    id, name, description, status, statusLabel, rejectionReason, acceptedTypes, maxSize, file, ];
}
