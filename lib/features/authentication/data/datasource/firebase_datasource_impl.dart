// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
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
    return _auth.signOut();
  }
}

@riverpod
FireBaseAuthMethods firebaseAuthMethod(FirebaseAuthMethodRef ref) {
  return FireBaseAuthMethodsImpl(FirebaseAuth.instance);
}
