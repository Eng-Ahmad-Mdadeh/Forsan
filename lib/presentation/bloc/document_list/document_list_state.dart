part of 'document_list_bloc.dart';

sealed class IDocumentListState extends Equatable {
  const IDocumentListState();
}

final class DocumentListInitial extends IDocumentListState {
  const DocumentListInitial();

  @override
  List<Object?> get props => [];
}

final class DocumentListLoading extends IDocumentListState {
  const DocumentListLoading();

  @override
  List<Object?> get props => [];
}

final class DocumentListLoaded extends IDocumentListState {
  const DocumentListLoaded({required this.documentList});

  final DocumentListModel? documentList;

  List<Item> get items => documentList?.items ?? const [];

  @override
  List<Object?> get props => [documentList];
}

final class DocumentListFailed extends IDocumentListState {
  const DocumentListFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
