import 'package:movie_app_auth/core/exceptions/base_exception.dart';

class SignupException extends BaseException {
  final String code;
  SignupException(super.message, this.code);
}
