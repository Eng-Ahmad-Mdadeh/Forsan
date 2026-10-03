part of 'legal_page_bloc.dart';

sealed class ILegalPageState extends Equatable {
  const ILegalPageState();
}

final class LegalPageInitial extends ILegalPageState {
  @override
  List<Object?> get props => [];
}

final class LegalPageLoading extends ILegalPageState {
  @override
  List<Object?> get props => [];
}

final class LegalPageLoaded extends ILegalPageState {
  const LegalPageLoaded({required this.legalPageModel});

  final BaseModel<LegalPageModel>? legalPageModel;

  @override
  List<Object?> get props => [legalPageModel];
}

final class LegalPageFailed extends ILegalPageState {
  const LegalPageFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
