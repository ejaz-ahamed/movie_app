import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_constants.g.dart';

class LoginConstants {
  final title = "Let's Get Started";
  final subtitle = "Welcome back!Please enter your Details";
  final textfield1 = "  E-mail:";
  final textfield1text = "Enter your E-mail";
  final textfield2 = "  Password:";
  final textfield2text = "Enter your Password";
  final btn1 = "Login";
  final btn2 = "Sign in with Google";
  final text = "Don't have an account?";
  final appName = 'FilmyBeatZ';
  final link = "  Sign Up";
  final logolink =
      "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png";
}

@riverpod
LoginConstants logConst(LogConstRef ref) {
  return LoginConstants();
}
