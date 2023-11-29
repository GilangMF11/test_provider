import 'package:equatable/equatable.dart';
import 'package:provider_dzikir/model/model_login.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final ModelLogin modelLogin;

  const LoginSuccess({required this.modelLogin});

  @override
  List<Object> get props => [modelLogin];
}

class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}