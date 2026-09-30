part of 'document_details_bloc.dart';

sealed class IDocumentDetailsState extends Equatable {
  const IDocumentDetailsState();
}

final class DocumentDetailsInitial extends IDocumentDetailsState {
  @override
  List<Object?> get props => [];
}

final class DocumentDetailsLoading extends IDocumentDetailsState {
  @override
  List<Object?> get props => [];
}

final class DocumentDetailsLoaded extends IDocumentDetailsState {
  const DocumentDetailsLoaded({required this.documentDetailsModel});

  final BaseModel<DocumentDetailsModel>? documentDetailsModel;

  @override
  List<Object?> get props => [documentDetailsModel];
}

final class DocumentDetailsFailed extends IDocumentDetailsState {
  const DocumentDetailsFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
