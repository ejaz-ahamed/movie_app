import 'package:movie_app_auth/features/api/data/datasource/objectbox_datasource.dart';
import 'package:movie_app_auth/features/api/data/datasource/objectbox_datasource_impl.dart';
import 'package:movie_app_auth/features/api/data/model/movie_objectbox_entity.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/objectbox_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_repository_impl.g.dart';

class ObjectBoxRepositoryImpl implements ObjectBoxRepository {
  final ObjectBoxDataSource dataSource;
  ObjectBoxRepositoryImpl({required this.dataSource});

  @override
  void addMovies(List<MovieEntity> entity) {
    final List<MovieEntityModel> moviesToAdd = [];
    for (final mov in entity) {
      final entityModel = MovieEntityModel(
          movieId: mov.id,
          originalTitle: mov.originalTitle,
          overview: mov.overview,
          posterPath: mov.posterPath,
          backdropPath: mov.backdropPath,
          title: mov.title,
          voteAverage: mov.voteAverage,
          releaseDate: mov.releaseDate.toString());
      moviesToAdd.add(entityModel);
    }
    dataSource.addMovies(moviesToAdd);
  }

  @override
  List<MovieEntity> getAllMovies() {
    final data = dataSource.getAllMovies();
    return [
      for (final model in data)
        MovieEntity(
            id: model.movieId ?? '',
            originalTitle: model.originalTitle ?? '',
            overview: model.overview ?? '',
            posterPath: model.posterPath ?? '',
            backdropPath: model.backdropPath ?? '',
            title: model.title ?? '',
            voteAverage: model.voteAverage ?? 0,
            releaseDate:
                DateTime.tryParse(model.releaseDate ?? '') ?? DateTime.now())
    ];
  }

  @override
  void clearAll() {
    dataSource.clearAll();
  }
}

@riverpod
ObjectBoxRepository objRepository(ObjRepositoryRef ref) {
  return ObjectBoxRepositoryImpl(dataSource: ref.watch(objDataSourceProvider));
}
