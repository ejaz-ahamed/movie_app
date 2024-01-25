import 'package:movie_app_auth/core/exceptions/getmovie_exception.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/movie_repository.dart';

final class GetMoviesUseCase {
  final MovieRepository repository;
  GetMoviesUseCase({required this.repository});

  Future<List<MovieEntity>> call() async {
    try {
      return await repository.getMovies();
    } catch (e) {
      throw GetMovieException("Error While FEtching Movies");
    }
  }
}
