// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app_auth/core/exceptions/auth/auth_failed_exception.dart';
import 'package:movie_app_auth/features/authentication/data/datasource/firebase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_datasource_impl.g.dart';

class FireBaseAuthMethodsImpl implements FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthMethodsImpl(this._auth);

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) {
    try {
      return _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailedException(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailedException(
            'The account already exists for this email.');
      } else {
        throw AuthenticationFailedException('Cannot signup. Please try again');
      }
    }
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) {
    try {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('Wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthenticationFailedException('User is disabled. Cannot login');
      } else {
        throw AuthenticationFailedException('Cannot login. Please try again');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }

  @override
  Future<void> sendEmailVerification() {
    return _auth.currentUser!.sendEmailVerification();
  }

  @override
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await _auth.signInWithCredential(credential);

        // UserCredential userCredential =
        //     await _auth.signInWithCredential(credential);

        // if (userCredential.user != null) {
        //   if (userCredential.additionalUserInfo!.isNewUser) {}
        // }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('Wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('Wrong password');
      } else if (e.code == 'user-disabled') {
        throw AuthenticationFailedException('User is disabled. Cannot login');
      } else {
        throw AuthenticationFailedException('Cannot login. Please try again');
      }
    }
  }
}

@riverpod
FireBaseAuthMethods firebaseAuthMethod(FirebaseAuthMethodRef ref) {
  return FireBaseAuthMethodsImpl(FirebaseAuth.instance);
}
