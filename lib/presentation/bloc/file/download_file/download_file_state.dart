part of 'download_file_bloc.dart';

sealed class IDownloadFileState extends Equatable {
  const IDownloadFileState();
}

final class DownloadFileInitial extends IDownloadFileState {
  const DownloadFileInitial();

  @override
  List<Object?> get props => [];
}

final class DownloadFileLoading extends IDownloadFileState {
  const DownloadFileLoading({required this.fileId});

  final String fileId;

  @override
  List<Object?> get props => [fileId];
}

final class DownloadFileLoaded extends IDownloadFileState {
  const DownloadFileLoaded({
    required this.response,
    required this.fileId,
  });

  final Uint8List response;
  final String fileId;

  @override
  List<Object?> get props => [response, fileId];
}

final class DownloadFileFailed extends IDownloadFileState {
  const DownloadFileFailed(this.message, {required this.fileId});

  final String message;
  final String fileId;

  @override
  List<Object?> get props => [message, fileId];
}