import 'package:firebase_authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:programming_course/config/global_contex.dart';
import 'package:programming_course/config/provider/bloc_provider.dart';
import 'package:programming_course/config/router/redirect.dart';
import 'package:programming_course/core/components/card/model/course_card_model.dart';
import 'package:programming_course/features/chat/ui/screen/chat.dart';
import 'package:programming_course/features/chat/ui/screen/chat_list.dart';
import 'package:programming_course/features/home/ui/screen/home_screen.dart';
import 'package:programming_course/features/authentication/ui/screen/login.dart';
import 'package:programming_course/features/authentication/ui/screen/register.dart';
import 'package:programming_course/features/course/ui/screen/course_detail.dart';
import 'package:programming_course/features/profile/ui/screen/profile_screen.dart';

class AppRoutes {
  final AuthRepository _authRepository = AuthRepository();
  final AppRedirectRepository appRedirectRepository = AppRedirectRepository();
  GoRouter get router => GoRouter(
          navigatorKey: NavigationService.navigatorKey,
          initialLocation: '/login',
          routes: <RouteBase>[
            GoRoute(
                path: '/login',
                name: 'Login',
                builder: (context, state) {
                  return BlocProvider.value(
                    value: AppProvidersAndRepos.authBloc,
                    child: const LoginScreen(),
                  );
                },
                redirect: (context, state) =>
                    appRedirectRepository.getLoginRedirectPath),
            GoRoute(
              path: '/sign-up',
              name: 'SignUp',
              builder: (context, state) {
                return RepositoryProvider.value(
                  value: AppProvidersAndRepos.signUpRepository,
                  child: BlocProvider.value(
                    value: AppProvidersAndRepos.authBloc,
                    child: const RegisterScreen(),
                  ),
                );
              },
            ),
            GoRoute(
              path: '/home',
              name: 'Home',
              builder: (context, state) {
                return BlocProvider.value(
                  value: AppProvidersAndRepos.authBloc,
                  child: const HomeScreen(),
                );
              },
            ),
            GoRoute(
              path: '/course/:id',
              name: 'CourseDetail',
              builder: (context, state) {
                return CourseDetailScreen(
                    courseData: state.extra as CourseModel);
              },
            ),
            GoRoute(
              path: '/profile',
              name: 'Profile',
              builder: (context, state) => const ProfileScreen(),
            ),
            GoRoute(
                path: '/chat',
                name: 'ChatList',
                builder: (context, state) {
                  return MultiBlocProvider(providers: [
                    BlocProvider.value(
                      value: AppProvidersAndRepos.chatBloc,
                    ),
                    BlocProvider.value(
                      value: AppProvidersAndRepos.authBloc,
                    ),
                  ], child: const ChatListView());
                },
                redirect: (context, state) =>
                    appRedirectRepository.getChatRedirect,
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'ChatView',
                    builder: (context, state) {
                      return RepositoryProvider.value(
                        value: AppProvidersAndRepos.chatRepository,
                        child: MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                value: AppProvidersAndRepos.chatBloc,
                              ),
                              BlocProvider.value(
                                value: AppProvidersAndRepos.authBloc,
                              ),
                            ],
                            child: ChatScreen(
                              userId: state.pathParameters['id'] ?? '',
                              email:
                                  _authRepository.getCurrentUser()!.email ?? '',
                            )),
                      );
                    },
                  )
                ])
          ]);
}
