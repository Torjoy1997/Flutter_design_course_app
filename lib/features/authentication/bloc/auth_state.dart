part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthUserStatus extends AuthState {
  final AuthUser? authUserStatus;

  const AuthUserStatus({this.authUserStatus});
}

final class SignUpSuccessState extends AuthState {
  // final String? userName;
  // final String email;

  // const SignUpSuccessState({this.userName, required this.email});
}

final class LoginSuccessState extends AuthState {}

final class ValidateStatusState extends AuthState {
  final ValidateStatus validateStatus;

  const ValidateStatusState({required this.validateStatus});
  @override
  List<Object> get props => [validateStatus];
}

final class LogoutState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String errorMessage;
  final String? errorCode;
  const AuthErrorState({this.errorMessage = '', this.errorCode});
}
