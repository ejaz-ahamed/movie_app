// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_auth/core/utils/show_snackbar.dart';
import 'package:movie_app_auth/features/authentication/data/datasource/firebase_datasource.dart';

class FireBaseAuthMethodsImpl implements FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthMethodsImpl(this._auth);

  @override
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }
}
