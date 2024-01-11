import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_auth/core/exceptions/auth/signin_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class SigninUsecase {
  final AuthRepository repository;
  SigninUsecase({required this.repository});
  Future<UserCredential> call(String email, String password) async {
    try {
      return await repository.signInWithEmail(email, password);
    } on FirebaseAuthException catch (e) {
      throw SigninException(e.message ?? "Sign up failed please retry", e.code);
    }
  }
}
