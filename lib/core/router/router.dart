import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/presentation/pages/favourite_movies_page.dart';
import 'package:movie_app_auth/features/api/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/api/presentation/pages/search_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/mobileauth_page.dart';
import 'package:movie_app_auth/features/api/presentation/pages/sec_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/signup_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/verifyotp_page.dart';
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
        if (user == null || !user.emailVerified && user.phoneNumber == null) {
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
      path: MobileAuthPage.routePath,
      builder: (context, state) => const MobileAuthPage(),
    ),
    GoRoute(
      path: OtpVerificationPage.routePath,
      builder: (context, state) => const OtpVerificationPage(),
    ),
    GoRoute(
      path: OverViewPage.routePath,
      builder: (context, state) => OverViewPage(
        entity: state.extra as MovieEntity,
      ),
    ),
    GoRoute(
      path: SearchPage.routePath,
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: FavouriteMoviesPage.routePath,
      builder: (context, state) => const FavouriteMoviesPage(),
    ),
  ],
);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
