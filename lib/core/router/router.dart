import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/features/authentication/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/signup_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/widgets/sec_page_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _router = GoRouter(
  initialLocation: HomePage.routePath,
  routes: [
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => const HomePage(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || !user.emailVerified) {
          return LoginPage.routePath;
        }
        return null;
      },
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignUpPage.routePath,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: MyHerp.routePath,
      builder: (context, state) => MyHerp(
        modelData: (state.extra as (MovieEntity,)).$1,
      ),
    ),
  ],
);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
