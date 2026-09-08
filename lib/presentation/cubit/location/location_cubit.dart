import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

sealed class ILocationState extends Equatable {
  const ILocationState();
}

class LocationInitial extends ILocationState { const LocationInitial(); @override List<Object?> get props => []; }
class LocationLoading extends ILocationState { const LocationLoading(); @override List<Object?> get props => []; }
class LocationLoaded extends ILocationState { const LocationLoaded(this.location); final LatLng location; @override List<Object?> get props => [location]; }
class LocationDefaultLoaded extends ILocationState { const LocationDefaultLoaded(this.location); final LatLng location; @override List<Object?> get props => [location]; }
class LocationFailure extends ILocationState { const LocationFailure(this.message); final String message; @override List<Object?> get props => [message]; }

class LocationCubit extends Cubit<ILocationState> {
  LocationCubit() : super(const LocationInitial());
  void setLocation(LatLng location) => emit(LocationLoaded(location));
  void setDefaultLocation(LatLng location) => emit(LocationDefaultLoaded(location));
  void fail(String message) => emit(LocationFailure(message));
}
