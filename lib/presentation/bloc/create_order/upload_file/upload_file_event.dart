part of 'upload_file_bloc.dart';

sealed class IUploadFileEvent extends Equatable {
  const IUploadFileEvent();
}

final class UploadFileEvent extends IUploadFileEvent {
  const UploadFileEvent(this.entity);

  final CreateOrderEntity entity;

  @override
  List<Object?> get props => [entity];
}
