import 'package:movie_app_auth/core/exceptions/base_exception.dart';

class SignOutException extends BaseException {
  final String code;
  SignOutException(super.message, this.code);
}
