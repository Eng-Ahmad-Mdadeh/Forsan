part of 'document_details_bloc.dart';

sealed class IDocumentDetailsEvent extends Equatable {
  const IDocumentDetailsEvent();
}

final class DocumentDetailsEvent extends IDocumentDetailsEvent {
  const DocumentDetailsEvent(this.entity);

  final DocumentEntity entity;

  @override
  List<Object?> get props => [entity];
}
