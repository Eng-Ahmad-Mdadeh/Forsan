part of 'upload_file_bloc.dart';

sealed class IUploadFileState extends Equatable {
  const IUploadFileState();
}

final class UploadFileInitial extends IUploadFileState {
  const UploadFileInitial();

  @override
  List<Object?> get props => [];
}

final class UploadFileLoading extends IUploadFileState {
  const UploadFileLoading({required this.requirementId});

  final String requirementId;

  @override
  List<Object?> get props => [requirementId];
}

final class UploadFileLoaded extends IUploadFileState {
  const UploadFileLoaded({
    required this.response,
    required this.requirementId,
  });

  final BaseModel<FileModel>? response;
  final String requirementId;

  @override
  List<Object?> get props => [response, requirementId];
}

final class UploadFileFailed extends IUploadFileState {
  const UploadFileFailed(this.message, {required this.requirementId});

  final String message;
  final String requirementId;

  @override
  List<Object?> get props => [message, requirementId];
}
