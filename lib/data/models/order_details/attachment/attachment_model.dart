part of '../order_details_model.dart';

@JsonSerializable(createToJson: false)
class Attachment extends Equatable {
  Attachment({
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
  final dynamic lockReason;
  final DateTime? uploadedAt;
  final String? downloadUrl;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);

  @override
  List<Object?> get props => [
    id, name, mimeType, size, source, kind, status, locked, lockReason, uploadedAt, downloadUrl, ];
}