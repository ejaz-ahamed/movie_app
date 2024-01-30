import 'package:movie_app_auth/core/exceptions/auth/invalid_credential_exception.dart';
import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class VerifyOtpUsecase {
  final AuthRepository repository;
  VerifyOtpUsecase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.verifyOtp(verificationId, otp);
    } on Exception {
      throw BaseException('Enter your otp correctly,try again');
    }
  }
}
