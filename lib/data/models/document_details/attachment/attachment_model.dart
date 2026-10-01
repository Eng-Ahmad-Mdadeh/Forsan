part of '../document_details_model.dart';

@JsonSerializable(createToJson: false)
class AttachmentModel extends Equatable {
  AttachmentModel({
    required this.id,
    required this.name,
    required this.mimeType,
    required this.size,
    required this.source,
    required this.kind,
    required this.status,
    required this.locked,
    required this.lockReason,
    required this.uploadedAt,
    required this.downloadUrl,
  });

  final String? id;
  final String? name;
  final String? mimeType;
  final int? size;
  final String? source;
  final String? kind;
  final String? status;
  final bool? locked;
  final String? lockReason;
  final DateTime? uploadedAt;
  final String? downloadUrl;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) => _$AttachmentModelFromJson(json);

  @override
  List<Object?> get props => [
    id, name, mimeType, size, source, kind, status, locked, lockReason, uploadedAt, downloadUrl, ];
}
