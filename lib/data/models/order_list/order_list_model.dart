import 'package:equatable/equatable.dart';
import 'package:forsan/data/models/pagination/page_pagination_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_list_model.g.dart';

@JsonSerializable(createFactory: false, createToJson: false)
class OrderListModel extends Equatable {
  const OrderListModel({
    required this.pagination,
    required this.counts,
  });

  final PagePaginationModel<Item> pagination;
  final Counts? counts;

  factory OrderListModel.fromJson(Map<String, dynamic> json) {
    return OrderListModel(
      pagination: PagePaginationModel<Item>.fromJson(
        json,
        (item) => Item.fromJson(item as Map<String, dynamic>),
      ),
      counts: json['counts'] == null
          ? null
          : Counts.fromJson(json['counts'] as Map<String, dynamic>),
    );
  }

  OrderListModel copyWith({
    PagePaginationModel<Item>? pagination,
    Counts? counts,
  }) {
    return OrderListModel(
      pagination: pagination ?? this.pagination,
      counts: counts ?? this.counts,
    );
  }

  @override
  List<Object?> get props => [pagination, counts];
}

class Counts extends Equatable {
  const Counts({required this.values});

  final Map<String, int> values;

  factory Counts.fromJson(Map<String, dynamic> json) => Counts(
    values: {
      for (final entry in json.entries)
        if (entry.value is num) entry.key: (entry.value as num).toInt(),
    },
  );

  @override
  List<Object?> get props => [values];
}

@JsonSerializable(createToJson: false)
class Item extends Equatable {
  const Item({
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
