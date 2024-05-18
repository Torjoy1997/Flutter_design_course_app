import 'package:firebase_authentication_repository/authentication_repository.dart';
import 'package:programming_course/features/authentication/bloc/auth_bloc.dart';
import 'package:programming_course/features/authentication/repos/sing_up.dart';
import 'package:programming_course/features/chat/bloc/chat_bloc.dart';
import 'package:programming_course/features/chat/repos/chat.dart';

class AppProvidersAndRepos {
  static final SignUpRepository signUpRepository = SignUpRepository();
  static final AuthRepository authRepository = AuthRepository();
  static final AuthBloc authBloc = AuthBloc(signUpRepository, authRepository);

  static final ChatRepository chatRepository = ChatRepository();
  static final ChatBloc chatBloc = ChatBloc(chatRepository);
}
