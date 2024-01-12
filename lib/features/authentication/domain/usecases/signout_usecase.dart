import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_auth/core/exceptions/auth/signout_exception.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';

final class SignOutUseCase {
  final AuthRepository repository;
  SignOutUseCase({required this.repository});

  Future<void> call() async {
    try {
      return await repository.signOut();
    } on FirebaseAuthException catch (e) {
      throw SignOutException(
          e.message ?? "SignOut failed please retry", e.code);
    }
  }
}
