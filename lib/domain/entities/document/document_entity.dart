import 'package:equatable/equatable.dart';

class DocumentEntity extends Equatable {
  const DocumentEntity  ({
    this.page = 1,
    this.pageSize = 20,
  });


  final int page;
  final int pageSize;

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'pageSize': pageSize,
    };
  }

  DocumentEntity copyWith({
    String? status,
    String? query,
    int? page,
    int? pageSize,
  }) {
    return DocumentEntity(

      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object?> get props => [page, pageSize];
}
