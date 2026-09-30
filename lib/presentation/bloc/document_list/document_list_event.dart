part of 'document_list_bloc.dart';

sealed class IDocumentListEvent extends Equatable {
  const IDocumentListEvent();
}

final class GetDocumentListEvent extends IDocumentListEvent {
  const GetDocumentListEvent(this.entity);

  final OrderListEntity entity;

  @override
  List<Object?> get props => [entity];
}

final class LoadMoreDocumentListEvent extends IDocumentListEvent {
  const LoadMoreDocumentListEvent(this.entity);

  final OrderListEntity entity;

  @override
  List<Object?> get props => [entity];
}
