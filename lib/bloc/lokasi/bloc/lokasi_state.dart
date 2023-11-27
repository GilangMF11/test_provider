import 'package:equatable/equatable.dart';
import 'package:provider_dzikir/model/model_lokasi.dart';

abstract class LocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationInitialState extends LocationState {}

class LocationLoadedState extends LocationState {
  final ModelLocation modelLocation;

  LocationLoadedState(this.modelLocation);

  @override
  List<Object?> get props => [modelLocation];
}

class LocationErrorState extends LocationState {
  final String error;

  LocationErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
