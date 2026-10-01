part of 'download_file_bloc.dart';

sealed class IDownloadFileEvent extends Equatable {
  const IDownloadFileEvent();
}

final class DownloadFileEvent extends IDownloadFileEvent {
  const DownloadFileEvent(this.entity, {required this.fileId});

  final CreateOrderEntity entity;
  final String fileId;

  @override
  List<Object?> get props => [entity, fileId];
}