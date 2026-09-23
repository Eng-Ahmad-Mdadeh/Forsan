import 'package:equatable/equatable.dart';

class OrderListEntity extends Equatable {
  const OrderListEntity({
    this.status,
    this.query,
    this.page = 1,
    this.pageSize = 20,
  });

  final String? status;
  final String? query;
  final int page;
  final int pageSize;

  Map<String, dynamic> toJson() {
    return {
      if (status != null && status!.isNotEmpty) 'status': status,
      if (query != null && query!.trim().isNotEmpty) 'q': query!.trim(),
      'page': page,
      'pageSize': pageSize,
    };
  }

  OrderListEntity copyWith({
    String? status,
    String? query,
    int? page,
    int? pageSize,
  }) {
    return OrderListEntity(
      status: status ?? this.status,
      query: query ?? this.query,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [status, query, page, pageSize];
}
