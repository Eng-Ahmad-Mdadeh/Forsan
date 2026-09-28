part of 'upload_file_bloc.dart';

sealed class IUploadFileEvent extends Equatable {
  const IUploadFileEvent();
}

final class UploadFileEvent extends IUploadFileEvent {
  const UploadFileEvent(this.entity, {required this.requirementId});

  final CreateOrderEntity entity;
  final String requirementId;

  @override
  List<Object?> get props => [entity, requirementId];
}
