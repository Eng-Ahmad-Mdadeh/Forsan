part of 'service_type_bloc.dart';

sealed class IServiceTypeState extends Equatable {
  const IServiceTypeState();
}

final class ServiceTypeInitial extends IServiceTypeState {
  @override
  List<Object?> get props => [];
}

final class ServiceTypeLoading extends IServiceTypeState {
  @override
  List<Object?> get props => [];
}

final class ServiceTypeLoaded extends IServiceTypeState {
  const ServiceTypeLoaded({required this.serviceTypeModel});

  final BaseModel<List<ServiceTypeModel>>? serviceTypeModel;

  @override
  List<Object?> get props => [serviceTypeModel];
}

final class ServiceTypeFailed extends IServiceTypeState {
  const ServiceTypeFailed(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
