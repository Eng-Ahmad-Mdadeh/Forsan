import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PagePaginationModel<T> extends Equatable {
  const PagePaginationModel({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.total,
  });

  final List<T>? items;
  final int? page;
  final int? pageSize;
  final int? total;

  factory PagePaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PagePaginationModelFromJson(json, fromJsonT);

  PagePaginationModel<T> copyWith({
    List<T>? items,
    int? page,
    int? pageSize,
    int? total,
  }) {
    return PagePaginationModel<T>(
      items: items ?? this.items,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [items, page, pageSize, total];
}
