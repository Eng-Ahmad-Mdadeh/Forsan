part of 'legal_page_bloc.dart';

sealed class ILegalPageEvent extends Equatable {
  const ILegalPageEvent();
}

final class LegalPageEvent extends ILegalPageEvent {
  const LegalPageEvent(this.entity);

  final LegalPageEntity entity;

  @override
  List<Object?> get props => [entity];
}
