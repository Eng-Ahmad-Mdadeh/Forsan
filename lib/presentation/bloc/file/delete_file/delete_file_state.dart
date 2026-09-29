part of 'delete_file_bloc.dart';

sealed class IDeleteFileState extends Equatable {
  const IDeleteFileState();
}

final class DeleteFileInitial extends IDeleteFileState {
  const DeleteFileInitial();

  @override
  List<Object?> get props => [];
}

final class DeleteFileLoading extends IDeleteFileState {
  const DeleteFileLoading({required this.requirementId});

  final String requirementId;

  @override
  List<Object?> get props => [requirementId];
}

final class DeleteFileLoaded extends IDeleteFileState {
  const DeleteFileLoaded({
    required this.response,
    required this.requirementId,
  });

  final BaseModel<void>? response;
  final String requirementId;

  @override
  List<Object?> get props => [response, requirementId];
}

final class DeleteFileFailed extends IDeleteFileState {
  const DeleteFileFailed(this.message, {required this.requirementId});

  final String message;
  final String requirementId;

  @override
  List<Object?> get props => [message, requirementId];
}
