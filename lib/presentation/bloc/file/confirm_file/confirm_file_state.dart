part of 'confirm_file_bloc.dart';

sealed class IConfirmFileState extends Equatable {
  const IConfirmFileState();
}

final class ConfirmFileInitial extends IConfirmFileState {
  const ConfirmFileInitial();

  @override
  List<Object?> get props => [];
}

final class ConfirmFileLoading extends IConfirmFileState {
  const ConfirmFileLoading({required this.requirementId});

  final String requirementId;

  @override
  List<Object?> get props => [requirementId];
}

final class ConfirmFileLoaded extends IConfirmFileState {
  const ConfirmFileLoaded({
    required this.response,
    required this.requirementId,
  });

  final BaseModel<void>? response;
  final String requirementId;

  @override
  List<Object?> get props => [response, requirementId];
}

final class ConfirmFileFailed extends IConfirmFileState {
  const ConfirmFileFailed(this.message, {required this.requirementId});

  final String message;
  final String requirementId;

  @override
  List<Object?> get props => [message, requirementId];
}
