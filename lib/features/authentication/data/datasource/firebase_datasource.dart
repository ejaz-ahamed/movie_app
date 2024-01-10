import 'package:flutter/material.dart';

abstract class FireBaseAuthMethods{
  Future<void> signUpWithEmail({required String email, required String password, required BuildContext context});
}