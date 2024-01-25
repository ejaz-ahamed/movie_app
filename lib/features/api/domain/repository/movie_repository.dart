import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();
  Future<List<MovieEntity>> topRated();
}
