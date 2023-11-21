import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
