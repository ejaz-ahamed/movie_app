import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class FireBaseAuthMethods {
  Future<UserCredential> signUpWithEmail(String email, String password);
  Future<UserCredential> signInWithEmail(String email, String password);
  Future<void> signOut();
  Future<void> sendEmailVerification();
  Future<void> signInWithGoogle(BuildContext context);
  Future<void> forgetPassword(String email);
  Future<(String, int?)> loginWithPhone(String phone, [int? resendToken]);
  Future<void> verifyOtp(String verificationId, String otp);
}
