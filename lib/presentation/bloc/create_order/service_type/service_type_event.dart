part of 'service_type_bloc.dart';

sealed class IServiceTypeEvent extends Equatable {
  const IServiceTypeEvent();
}

final class ServiceTypeEvent extends IServiceTypeEvent {
  const ServiceTypeEvent();

  @override
  List<Object?> get props => [];
}
