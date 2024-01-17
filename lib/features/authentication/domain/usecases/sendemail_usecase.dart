import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_auth/core/exceptions/auth/emailverify_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class SendEmailVerificationUseCase {
  final AuthRepository repository;
  SendEmailVerificationUseCase({required this.repository});

  Future<void> call() async {
    try {
      await repository.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw EmailVerifyException(
          e.message ?? "Email Verification failed please retry", e.code);
    }
  }
}
