import 'package:equatable/equatable.dart';

class DocumentEntity extends Equatable {
  const DocumentEntity({
    this.page = 1,
    this.pageSize = 20,
    this.orderId,
  });

  final int page;
  final int pageSize;
  final String? orderId;

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'pageSize': pageSize,
    };
  }

  DocumentEntity copyWith({
    int? page,
    int? pageSize,
    String? orderId ,
  }) {
    return DocumentEntity(
      page: page ?? this.page,
      orderId: orderId?? this.orderId,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [page, pageSize, orderId];
}
