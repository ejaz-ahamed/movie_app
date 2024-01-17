import 'package:movie_app_auth/core/exceptions/base_exception.dart';

class EmailVerifyException extends BaseException {
  final String code;
  EmailVerifyException(super.message, this.code);
}
