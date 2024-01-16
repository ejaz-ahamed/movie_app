import 'package:movie_app_auth/core/exceptions/base_exception.dart';

final class AuthenticationFailedException extends BaseException {
  AuthenticationFailedException(super.reason);
}