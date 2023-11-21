import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class InitialState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final bool status;
  final String token;

  AuthenticatedState({required this.status, required this.token});

  @override
  List<Object?> get props => [status, token];
}

class ErrorState extends AuthenticationState {
  final String errorMessage;

  ErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
