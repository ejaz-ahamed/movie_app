// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_auth/features/authentication/data/datasource/firebase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_datasource_impl.g.dart';

class FireBaseAuthMethodsImpl implements FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthMethodsImpl(this._auth);

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
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
