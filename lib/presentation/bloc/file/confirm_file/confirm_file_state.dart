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
  const ConfirmFileLoading();


  @override
  List<Object?> get props => [];
}

final class ConfirmFileLoaded extends IConfirmFileState {
  const ConfirmFileLoaded({
    required this.response,

  });

  final BaseModel<void>? response;

  @override
  List<Object?> get props => [response];
}

final class ConfirmFileFailed extends IConfirmFileState {
  const ConfirmFileFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
