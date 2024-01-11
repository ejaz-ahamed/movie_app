import 'package:movie_app_auth/core/exceptions/base_exception.dart';

class SigninException extends BaseException {
  final String code;
  SigninException(super.message, this.code);
}
