import 'package:movie_app_auth/core/exceptions/getmovie_exception.dart';
import 'package:movie_app_auth/core/utils/show_network.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/movie_repository.dart';
import 'package:movie_app_auth/features/api/domain/repository/objectbox_repository.dart';

final class GetMoviesUseCase {
  final MovieRepository repository;
  final ObjectBoxRepository objRepository;
  GetMoviesUseCase({required this.repository, required this.objRepository});

  Future<List<MovieEntity>> call() async {
    try {
      if (await NetworkUtils.hasNetwork()) {
        final data = await repository.getMovies();
        objRepository.clearAll();
        objRepository.addMovies(data);
        return data;
      } else {
        final dataFromLocal = objRepository.getAllMovies();
        return dataFromLocal;
      }
    } catch (e) {
      throw GetMovieException("Error While Fetching Movies");
    }
  }
}
