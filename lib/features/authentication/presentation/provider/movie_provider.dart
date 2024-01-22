import 'package:movie_app_auth/features/authentication/data/repository/movie_repository_impl.dart';
import 'package:movie_app_auth/features/authentication/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/movie_repository.dart';
import 'package:movie_app_auth/features/authentication/domain/usecases/getmovies_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  late final MovieRepository repository;
  @override
  Future<List<MovieEntity>> build() async {
    repository = ref.watch(movieRepositoryProvider);
    return GetMoviesUseCase(repository: repository)();
  }
}
