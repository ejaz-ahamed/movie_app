import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_constants.g.dart';

class SignUpConstants {
  final title = "Create A New Account";
  final subTitle = "Enter your Details";
  final textfield = "  Name:";
  final textfieldtext = "Enter your Name";
  final textfield2 = "  Phone No:";
  final textfield2text = "Enter your Number";
}

@riverpod
SignUpConstants signConst(SignConstRef ref) {
  return SignUpConstants();
}
