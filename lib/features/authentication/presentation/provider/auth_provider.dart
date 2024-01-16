import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/core/utils/show_snackbar.dart';
import 'package:movie_app_auth/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signout_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/home_page.dart';
import 'package:movie_app_auth/features/authentication/presentation/pages/login_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final TextEditingController nameController;
  late final TextEditingController mobileController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AuthRepository repository;
  @override
  void build(BuildContext context) {
    this.context = context;
    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    repository = ref.read(authRepositoryProvider);

    ref.onDispose(dispose);
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileController.dispose();
  }

  void clear() {
    nameController.clear();
    mobileController.clear();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await SignupUsecase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      SigninUsecase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routePath));
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
}
