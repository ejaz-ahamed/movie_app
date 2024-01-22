import 'package:movie_app_auth/core/exceptions/auth/auth_failed_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class ForgetPasswordUseCase {
  final AuthRepository repository;
  ForgetPasswordUseCase({required this.repository});

  Future<void> call(String email) async {
    try {
      await repository.forgetPassword(email);
    } on Exception catch (e) {
      throw AuthenticationFailedException("$e");
    }
  }
}
