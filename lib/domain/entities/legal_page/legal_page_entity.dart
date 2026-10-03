import 'package:equatable/equatable.dart';

class LegalPageEntity extends Equatable {
  const LegalPageEntity({this.page});

  final String? page;

  LegalPageEntity copyWith({String? page}) {
    return LegalPageEntity(page: page ?? this.page);
  }

  @override
  List<Object?> get props => [page];
}
