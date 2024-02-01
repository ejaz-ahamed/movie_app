import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/movie_repository.dart';

final class SearchMovieUseCase {
  final MovieRepository repository;
  SearchMovieUseCase({required this.repository});

  Future<List<MovieEntity>> call(String text) async {
    try {
      return await repository.searchMovies(text);
    } catch (e) {
      throw BaseException('Failed to load Movies');
    }
  }
}
