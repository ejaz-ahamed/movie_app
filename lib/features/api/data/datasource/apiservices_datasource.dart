import 'package:movie_app_auth/features/api/data/model/movieapi_model.dart';

abstract class ApiServicesDataSource {
  Future<MovieModel> getMovies();
  Future<MovieModel> topRated();
  Future<MovieModel> searchMovies(String text);
}
