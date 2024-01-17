import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class FireBaseAuthMethods {
  Future<UserCredential> signUpWithEmail(String email, String password);
  Future<UserCredential> signInWithEmail(String email, String password);
  Future<void> signOut();
  Future<void> sendEmailVerification();
  Future<void> signInWithGoogle(BuildContext context);
}
