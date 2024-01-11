import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_auth/core/exceptions/auth/signup_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class SignupUsecase {
  final AuthRepository repository;
  SignupUsecase({required this.repository});
  Future<UserCredential> call(String email, String password) async {
    try {
      return await repository.signUpWithEmail(email, password);
    } on FirebaseAuthException catch (e) {
      throw SignupException(e.message ?? "Sign up failed please retry", e.code);
    }
  }
}
