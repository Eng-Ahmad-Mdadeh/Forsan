import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_list_model.g.dart';

@JsonSerializable(createToJson: false)
class OrderListModel extends Equatable {
  OrderListModel({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.total,
    required this.counts,
  });

  final List<Item>? items;
  final int? page;
  final int? pageSize;
  final int? total;
  final Counts? counts;

  factory OrderListModel.fromJson(Map<String, dynamic> json) => _$OrderListModelFromJson(json);

  @override
  List<Object?> get props => [
    items, page, pageSize, total, counts, ];
}

@JsonSerializable(createToJson: false)
class Counts extends Equatable {
  Counts({
    required this.all,
    required this.underReview,
  });

  final int? all;

  @JsonKey(name: 'UNDER_REVIEW')
  final int? underReview;

  factory Counts.fromJson(Map<String, dynamic> json) => _$CountsFromJson(json);

  @override
  List<Object?> get props => [
    all, underReview, ];
}

@JsonSerializable(createToJson: false)
class Item extends Equatable {
  Item({
    required this.id,
    required this.reference,
    required this.serviceName,
    required this.categoryName,
    required this.status,
    required this.displayStatus,
    required this.statusLabel,
    required this.progress,
    required this.createdAt,
    required this.consultant,
  });

  final String? id;
  final String? reference;
  final String? serviceName;
  final String? categoryName;
  final String? status;
  final String? displayStatus;
  final String? statusLabel;
  final int? progress;
  final DateTime? createdAt;
  final dynamic consultant;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  List<Object?> get props => [
    id, reference, serviceName, categoryName, status, displayStatus, statusLabel, progress, createdAt, consultant, ];
}
