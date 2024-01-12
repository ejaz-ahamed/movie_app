import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseAuthMethods {
  Future<UserCredential> signUpWithEmail(String email, String password);
  Future<UserCredential> signInWithEmail(String email, String password);
  Future<void> signOut();
}
