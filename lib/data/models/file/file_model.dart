import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable(createToJson: false)
class FileModel extends Equatable {
  FileModel({
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
    required this.fieldId,
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
  final String? fieldId;

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);

  @override
  List<Object?> get props => [
    id, name, mimeType, size, source, kind, status, locked, lockReason, uploadedAt, downloadUrl, fieldId, ];
}
