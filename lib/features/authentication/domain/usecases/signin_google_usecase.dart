import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_auth/core/exceptions/auth/auth_failed_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class SignInWithGoogleUseCase {
  final AuthRepository repository;
  SignInWithGoogleUseCase({required this.repository});

  Future<void> call(BuildContext context) async {
    try {
      await repository.signInWithGoogle(context);
    } on FirebaseAuthException catch (e) {
      throw AuthenticationFailedException(
          e.message ?? "Google Verification failed please retry");
    }
  }
}
