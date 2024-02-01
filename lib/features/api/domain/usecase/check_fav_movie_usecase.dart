import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';

final class CheckFavMovieUsecase {
  bool call(String movieId, List<MovieEntity> allFavMovies) {
    for (final movie in allFavMovies) {
      if (movie.id == movieId) {
        return true;
      }
    }

    return false;
  }
}
