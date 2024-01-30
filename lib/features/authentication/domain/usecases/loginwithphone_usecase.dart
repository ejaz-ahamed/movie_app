import 'package:movie_app_auth/core/exceptions/auth/invalid_credential_exception.dart';
import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class LoginWithPhoneUsecase{
  final AuthRepository repository;
  LoginWithPhoneUsecase({required this.repository});
  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return await repository.loginWithPhone(phone);
    } on Exception {
      throw BaseException('Enter your phone number correctly');
    }
  }
}