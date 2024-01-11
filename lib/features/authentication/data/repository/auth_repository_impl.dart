import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_auth/features/authentication/data/datasource/firebase_datasource_impl.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../datasource/firebase_datasource.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FireBaseAuthMethods dataSource;
  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<UserCredential> signUpWithEmail(String email, String password) {
    return dataSource.signUpWithEmail(email, password);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithEmail(String email, String password) {
    return dataSource.signInWithEmail(email, password);
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(dataSource: ref.watch(firebaseAuthMethodProvider));
}
