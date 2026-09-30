part of 'document_details_bloc.dart';

sealed class IDocumentDetailsState extends Equatable {
  const IDocumentDetailsState();
}

final class DocumentDetailsInitial extends IDocumentDetailsState {
  const DocumentDetailsInitial();

  @override
  List<Object?> get props => [];
}

final class DocumentDetailsLoading extends IDocumentDetailsState {
  const DocumentDetailsLoading();

  @override
  List<Object?> get props => [];
}

final class DocumentDetailsLoaded extends IDocumentDetailsState {
  const DocumentDetailsLoaded({required this.documentDetails});

  final BaseModel<DocumentDetailsModel>? documentDetails;

  @override
  List<Object?> get props => [documentDetails];
}

final class DocumentDetailsFailed extends IDocumentDetailsState {
  const DocumentDetailsFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
