import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_list_model.g.dart';

@JsonSerializable(createToJson: false)
class DocumentListModel extends Equatable {
  DocumentListModel({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.total,
  });

  final List<Item>? items;
  final int? page;
  final int? pageSize;
  final int? total;

  factory DocumentListModel.fromJson(Map<String, dynamic> json) => _$DocumentListModelFromJson(json);

  @override
  List<Object?> get props => [
    items, page, pageSize, total, ];
}

@JsonSerializable(createToJson: false)
class Item extends Equatable {
  Item({
    required this.id,
    required this.reference,
    required this.serviceSlug,
    required this.serviceName,
    required this.categoryName,
    required this.status,
    required this.displayStatus,
    required this.statusLabel,
    required this.progress,
    required this.createdAt,
    required this.consultant,
    required this.documentsStatus,
    required this.documentsStatusLabel,
    required this.requiredCount,
    required this.attachmentCount,
  });

  final String? id;
  final String? reference;
  final String? serviceSlug;
  final String? serviceName;
  final String? categoryName;
  final String? status;
  final String? displayStatus;
  final String? statusLabel;
  final int? progress;
  final DateTime? createdAt;
  final dynamic consultant;
  final String? documentsStatus;
  final String? documentsStatusLabel;
  final int? requiredCount;
  final int? attachmentCount;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  List<Object?> get props => [
    id, reference, serviceSlug, serviceName, categoryName, status, displayStatus, statusLabel, progress, createdAt, consultant, documentsStatus, documentsStatusLabel, requiredCount, attachmentCount, ];
}
