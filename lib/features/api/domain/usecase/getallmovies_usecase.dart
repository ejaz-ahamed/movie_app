import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/firebase_firestore_repository.dart';

final class GetAllMoviesFromFirestoreUseCase {
  final FireBaseFireStoreRepository repository;
  GetAllMoviesFromFirestoreUseCase({required this.repository});

  Stream<List<MovieEntity>> call() {
    try {
      return repository.getAllMovies();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
