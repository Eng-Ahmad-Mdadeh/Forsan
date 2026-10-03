part of 'confirm_file_bloc.dart';

sealed class IConfirmFileEvent extends Equatable {
  const IConfirmFileEvent();
}

final class ConfirmFileEvent extends IConfirmFileEvent {
  const ConfirmFileEvent(this.entity);

  final CreateOrderEntity entity;


  @override
  List<Object?> get props => [entity, ];
}
