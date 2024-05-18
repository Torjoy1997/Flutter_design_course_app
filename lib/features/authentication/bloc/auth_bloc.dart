import 'package:firebase_authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programming_course/features/authentication/repos/sing_up.dart';
import 'package:programming_course/utils/constants/enums.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpRepository _signUpRepository;
  final AuthRepository _authRepository;
  AuthBloc(this._signUpRepository, this._authRepository)
      : super(const AuthUserStatus()) {
    on<SignUpEvent>((event, emit) async {
      try {
        await _signUpRepository.saveUserRecord();
        emit(SignUpSuccessState());
      } catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      try {
        await _authRepository.signInWithEmailAndPassword(
            event.email, event.password);
        emit(LoginSuccessState());
      } catch (e) {
        emit(AuthErrorState(
          errorMessage: e.toString(),
        ));
      }
    });

    on<LogOutEvent>((event, emit) async {
      try {
        await _authRepository.signOut();
        emit(LogoutState());
      } catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
      }
    });

    on<ValidateStatusEvent>((event, emit) {
      emit(ValidateStatusState(validateStatus: event.validateStatus));
    });
  }
}
