import 'package:movie_app_auth/features/api/data/datasource/favourite_movie_datasource.dart';
import 'package:movie_app_auth/features/api/data/datasource/favourite_movie_datasource_impl.dart';
import 'package:movie_app_auth/features/api/data/model/firestore_model.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/firebase_firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_firestore_repository_impl.g.dart';

class FirebaseFireStoreRepositoryImpl implements FireBaseFireStoreRepository {
  final FavouriteMovieDataSource dataSource;
  FirebaseFireStoreRepositoryImpl({required this.dataSource});

  @override
  Future<void> addtofirestore(MovieEntity entity) async {
    final movietoAdd = FireStoreModel(
        id: entity.id,
        originalTitle: entity.originalTitle,
        overview: entity.overview,
        posterPath: entity.posterPath,
        backdropPath: entity.backdropPath,
        title: entity.title,
        voteAverage: entity.voteAverage,
        releaseDate: entity.releaseDate);
    await dataSource.addtoFirestore(movietoAdd);
  }

  @override
  Future<void> deleteFromFireStore(String id) async {
    await dataSource.deleteFromFireStore(id);
  }

  @override
  Stream<List<MovieEntity>> getAllMovies() async* {
    final ds = dataSource.getAllMovies();
    await for (final snapshot in ds) {
      final docs = snapshot.docs;
      yield [
        for (final model in docs)
          MovieEntity(
            id: model.data().id,
            originalTitle: model.data().originalTitle,
            overview: model.data().overview,
            posterPath: model.data().posterPath,
            backdropPath: model.data().backdropPath,
            title: model.data().title,
            voteAverage: model.data().voteAverage,
            releaseDate: model.data().releaseDate,
          )
      ];
    }
  }
}

@riverpod
FireBaseFireStoreRepository firestoreRepository(FirestoreRepositoryRef ref) {
  return FirebaseFireStoreRepositoryImpl(
      dataSource: ref.watch(favMovieDataSourceProvider));
}
