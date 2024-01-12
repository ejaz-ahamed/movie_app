import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app_auth/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signout_usecase.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/signup_usecase.dart';
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
  void build() {
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

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return SignupUsecase(repository: repository)(email, password);
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    return SigninUsecase(repository: repository)(email, password);
  }

  Future<void> signout() {
    return SignOutUseCase(repository: repository)();
  }
}
