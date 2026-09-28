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
  const UploadFileLoading();

  @override
  List<Object?> get props => [];
}

final class UploadFileLoaded extends IUploadFileState {
  const UploadFileLoaded({required this.response});

  final BaseModel<void>? response;

  @override
  List<Object?> get props => [response];
}

final class UploadFileFailed extends IUploadFileState {
  const UploadFileFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
