import 'package:movie_app_auth/core/exceptions/getmovie_exception.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/movie_repository.dart';

final class TopRatedUseCase {
  final MovieRepository repository;
  TopRatedUseCase({required this.repository});

  Future<List<MovieEntity>> call() async {
    try {
      return await repository.topRated();
    } catch (e) {
      throw GetMovieException("Error While FEtching Movies");
    }
  }
}
