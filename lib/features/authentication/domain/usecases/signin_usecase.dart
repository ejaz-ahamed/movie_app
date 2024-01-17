import 'package:movie_app_auth/core/exceptions/auth/auth_failed_exception.dart';
import 'package:movie_app_auth/core/exceptions/auth/invalid_credential_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class SigninUsecase {
  final AuthRepository repository;
  SigninUsecase({required this.repository});
  Future<void> call(String email, String password) async {
    /// Verify email and password
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.signInWithEmail(email, password);
    } on Exception {
      throw AuthenticationFailedException(
          "Something Went Wrong! Please try again...");
    }
  }
}
