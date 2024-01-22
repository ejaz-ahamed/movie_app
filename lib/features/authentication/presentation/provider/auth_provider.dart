import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/core/utils/show_snackbar.dart';
import 'package:movie_app_auth/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/forgetpassword_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/sendemail_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signin_google_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signout_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/login_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthRepository repository;
  @override
  bool build(BuildContext context) {
    repository = ref.read(authRepositoryProvider);
    return false;
  }

  Future<void> sendEmailVerification() async {
    try {
      await SendEmailVerificationUseCase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await SignupUsecase(repository: repository)(email, password);
      await sendEmailVerification();
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      state = true;
      await SigninUsecase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routePath));
      state = false;
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> forgetPassword(String email) async {
    try {
      await ForgetPasswordUseCase(repository: repository)(email);
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signout() async {
    try {
      await SignOutUseCase(repository: repository)();
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signinWithGoogle() async {
    try {
      await SignInWithGoogleUseCase(repository: repository)(context);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }
}
