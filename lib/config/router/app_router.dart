import 'package:go_router/go_router.dart';
import 'package:programming_course/config/global_contex.dart';
import 'package:programming_course/core/components/card/model/course_card_model.dart';
import 'package:programming_course/features/Home/ui/screen/home_screen.dart';
import 'package:programming_course/features/course/ui/screen/course_detail.dart';
import 'package:programming_course/features/profile/ui/screen/profile_screen.dart';

class AppRoutes {
  GoRouter get router => GoRouter(
          navigatorKey: NavigationService.navigatorKey,
          initialLocation: '/home',
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              name: 'Home',
              builder: (context, state) {
                return const HomeScreen();
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
            )
          ]);
}
