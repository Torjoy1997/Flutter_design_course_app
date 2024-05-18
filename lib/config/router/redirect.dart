import 'package:firebase_authentication_repository/authentication_repository.dart';

import '../../utils/constants/enums.dart';

class AppRedirectRepository {
  final AuthRepository _authRepository = AuthRepository();

  AuthenticationStatus setAppStatus() {
    final user = _authRepository.getCurrentUser();
    AuthenticationStatus authenticationStatus =
        AuthenticationStatus.unAuthenticated;
    if (user != null) {
      authenticationStatus = AuthenticationStatus.authenticated;
    }

    return authenticationStatus;
  }

  String? get getLoginRedirectPath {
    if (setAppStatus() == AuthenticationStatus.authenticated) {
      return '/home';
    } else {
      return null;
    }
  }

  String? get getChatRedirect {
    final user = _authRepository.getCurrentUser();
    if (user != null) {
      if (user.email != 'islamtarek4@gmail.com') {
        return '/chat/${user.uid}';
      }
    }

    return null;
  }
}
