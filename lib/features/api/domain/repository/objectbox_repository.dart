import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';

abstract class ObjectBoxRepository {
  void addMovies(List<MovieEntity> entity);
  List<MovieEntity> getAllMovies();
  void clearAll();
}
