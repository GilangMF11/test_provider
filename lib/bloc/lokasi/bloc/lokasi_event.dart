import 'package:equatable/equatable.dart';

abstract class LokasiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchLokasiEvent extends LokasiEvent {}

class SelectLokasiEvent extends LokasiEvent {
  final String label;

  SelectLokasiEvent(this.label);

  @override
  List<Object?> get props => [label];
}