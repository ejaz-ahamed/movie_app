import 'package:movie_app_auth/features/authentication/domain/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
}
