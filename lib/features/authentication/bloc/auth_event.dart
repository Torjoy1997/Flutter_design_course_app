part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

class LogOutEvent extends AuthEvent {}

class ValidateStatusEvent extends AuthEvent {
  final ValidateStatus validateStatus;

  const ValidateStatusEvent({required this.validateStatus});
}
