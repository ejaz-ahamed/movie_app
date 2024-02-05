import 'package:movie_app_auth/features/api/data/model/movie_objectbox_entity.dart';

abstract class ObjectBoxDataSource {
  void addMovies(List<MovieEntityModel> entityModel);
  List<MovieEntityModel> getAllMovies();
  void clearAll();
}
