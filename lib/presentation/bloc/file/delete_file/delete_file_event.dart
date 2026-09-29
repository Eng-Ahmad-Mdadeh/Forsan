part of 'delete_file_bloc.dart';

sealed class IDeleteFileEvent extends Equatable {
  const IDeleteFileEvent();
}

final class DeleteFileEvent extends IDeleteFileEvent {
  const DeleteFileEvent(this.entity, {required this.requirementId});

  final CreateOrderEntity entity;
  final String requirementId;

  @override
  List<Object?> get props => [entity, requirementId];
}
