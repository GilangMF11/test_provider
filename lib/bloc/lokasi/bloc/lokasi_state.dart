import 'package:equatable/equatable.dart';
import 'package:provider_dzikir/model/model_lokasi.dart';
abstract class LokasiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LokasiInitialState extends LokasiState {}

class LokasiLoadingState extends LokasiState {}

class LokasiLoadedState extends LokasiState {
  final List<String> labels;

  LokasiLoadedState(this.labels);

  @override
  List<Object?> get props => [labels];
}

class LokasiErrorState extends LokasiState {
  final String errorMessage;

  LokasiErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}