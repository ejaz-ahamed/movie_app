import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_auth/features/authentication/data/datasource/firebase_datasource_impl.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../datasource/firebase_datasource.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FireBaseAuthMethods dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<UserCredential> signUpWithEmail(
    String email,
    String password,
  ) {
    return dataSource.signUpWithEmail(email, password);
  }

  @override
  Future<void> signOut() async {
    return dataSource.signOut();
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await dataSource.signInWithEmail(email, password);
  }

  @override
  Future<void> sendEmailVerification() async {
    return await dataSource.sendEmailVerification();
  }

  @override
  Future<void> signInWithGoogle(BuildContext context) async {
    return await dataSource.signInWithGoogle(context);
  }

  @override
  Future<void> forgetPassword(String email) async {
    return await dataSource.forgetPassword(email);
  }

  @override
  Future<(String, int?)> loginWithPhone(String phone) async {
    return await dataSource.loginWithPhone(phone);
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    await dataSource.verifyOtp(verificationId, otp);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(dataSource: ref.watch(firebaseAuthMethodProvider));
}
