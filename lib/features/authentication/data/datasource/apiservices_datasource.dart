import 'package:movie_app_auth/features/authentication/data/model/movieapi_model.dart';

abstract class ApiServicesDataSource {
  Future<MovieModel> getMovies();
}
