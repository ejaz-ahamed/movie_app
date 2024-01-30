import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/exceptions/auth/signin_exception.dart';
import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/core/utils/show_snackbar.dart';
import 'package:movie_app_auth/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/forgetpassword_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/loginwithphone_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/sendemail_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signin_google_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signout_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:movie_app_auth/features/api/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/verifyotp_usecase.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/verifyotp_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/provider/auth_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthRepository repository;
  @override
  AuthState build() {
    repository = ref.read(authRepositoryProvider);
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await SendEmailVerificationUseCase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signUpWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await SignupUsecase(repository: repository)(email, password);
      Future.sync(() => sendEmailVerification(context));
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    try {
      await SigninUsecase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routePath));
    } on SigninException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> forgetPassword(String email, BuildContext context) async {
    try {
      await ForgetPasswordUseCase(repository: repository)(email);
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signout(BuildContext context) async {
    try {
      await SignOutUseCase(repository: repository)();
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUsecase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signInWithPhone(BuildContext context, String phone) async {
    try {
      final verificationData =
          await LoginWithPhoneUsecase(repository: repository)(phone);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.push(OtpVerificationPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      await SignInWithGoogleUseCase(repository: repository)(context);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }
}
