import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';

abstract class FireBaseFireStoreRepository {
  Future<void> addtofirestore(MovieEntity entity);
  Future<void> deleteFromFireStore(String id);
  Stream<List<MovieEntity>> getAllMovies();
}
