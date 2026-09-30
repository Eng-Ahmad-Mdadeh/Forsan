import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_details_model.g.dart';

@JsonSerializable(createToJson: false)
class DocumentDetailsModel extends Equatable {
  DocumentDetailsModel({
    required this.requiredAction,
    required this.requiredDocuments,
    required this.attachments,
    required this.uploads,
  });

  final dynamic requiredAction;
  final List<dynamic>? requiredDocuments;
  final List<Attachment>? attachments;
  final List<Attachment>? uploads;

  factory DocumentDetailsModel.fromJson(Map<String, dynamic> json) => _$DocumentDetailsModelFromJson(json);

  @override
  List<Object?> get props => [
    requiredAction, requiredDocuments, attachments, uploads, ];
}

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
  final String? lockReason;
  final DateTime? uploadedAt;
  final String? downloadUrl;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);

  @override
  List<Object?> get props => [
    id, name, mimeType, size, source, kind, status, locked, lockReason, uploadedAt, downloadUrl, ];
}
