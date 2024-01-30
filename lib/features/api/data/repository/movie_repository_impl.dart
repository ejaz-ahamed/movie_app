import 'package:movie_app_auth/features/api/data/datasource/apiservices_datasource.dart';
import 'package:movie_app_auth/features/api/data/datasource/apiservices_datasources_impl.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository_impl.g.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiServicesDataSource dataSource;
  MovieRepositoryImpl({required this.dataSource});

  @override
  Future<List<MovieEntity>> getMovies() async {
    final ds = await dataSource.getMovies();

    late List<MovieEntity> results;
    results = [
      for (final result in ds.results)
        MovieEntity(
          id: result.id.toString(),
          originalTitle: result.originalTitle,
          overview: result.overview,
          posterPath: result.posterPath,
          title: result.title,
          backdropPath: result.backdropPath,
          voteAverage: result.voteAverage,
          releaseDate: result.releaseDate,
        )
    ];
    return results;
  }

  @override
  Future<List<MovieEntity>> topRated() async {
    final data = await dataSource.topRated();

    late List<MovieEntity> results;
    results = [
      for (final result in data.results)
        MovieEntity(
          id: result.id.toString(),
          originalTitle: result.originalTitle,
          backdropPath: result.backdropPath,
          overview: result.overview,
          posterPath: result.posterPath,
          title: result.title,
          voteAverage: result.voteAverage,
          releaseDate: result.releaseDate,
        )
    ];
    return results;
  }
}

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) {
  return MovieRepositoryImpl(dataSource: ref.watch(apiDataSourceProvider));
}
