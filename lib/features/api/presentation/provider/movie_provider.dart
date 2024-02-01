import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/core/utils/show_snackbar.dart';
import 'package:movie_app_auth/features/api/data/repository/firebase_firestore_repository_impl.dart';
import 'package:movie_app_auth/features/api/data/repository/movie_repository_impl.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/movie_repository.dart';
import 'package:movie_app_auth/features/api/domain/usecase/addtofirebase_usecase.dart';
import 'package:movie_app_auth/features/api/domain/usecase/check_fav_movie_usecase.dart';
import 'package:movie_app_auth/features/api/domain/usecase/deletefromfirebase_usecase.dart';
import 'package:movie_app_auth/features/api/domain/usecase/getallmovies_usecase.dart';
import 'package:movie_app_auth/features/api/domain/usecase/getmovies_usecase.dart';
import 'package:movie_app_auth/features/api/domain/usecase/search_movie_usecase.dart';
import 'package:movie_app_auth/features/api/domain/usecase/toprated_usecase.dart';
import 'package:movie_app_auth/features/api/presentation/provider/movie_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  @override
  Future<MovieProviderState> build() async {
    final MovieRepository repository = ref.watch(movieRepositoryProvider);
    getAllMovies();
    final result = await Future.wait([
      GetMoviesUseCase(repository: repository)(),
      TopRatedUseCase(repository: repository)(),
    ]);
    return MovieProviderState(
        searchmovies: null,
        getMovies: result[0],
        toprated: result[1],
        favMovies: [],
        favMoviesStream: getAllMovies().asBroadcastStream());
  }

  Future<void> searchMovies(String text, BuildContext context) async {
    try {
      final repository = ref.watch(movieRepositoryProvider);
      final data = await SearchMovieUseCase(repository: repository)(text);
      state = AsyncValue.data(state.value!.copyWith(searchmovies: data));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showSnackBar(context, e.message));
    }
  }

  Future<void> addtoFireStore(MovieEntity entity) async {
    final repository = ref.watch(firestoreRepositoryProvider);
    await AddToFireStoreUsecase(repository: repository)(entity);
  }

  Future<void> deleteFromFireStore(String id) async {
    final repository = ref.watch(firestoreRepositoryProvider);
    await DeleteFromFirebaseUseCase(repository: repository)(id);
  }

  Stream<List<MovieEntity>> getAllMovies() async* {
    final repository = ref.watch(firestoreRepositoryProvider);
    await for (final favMovies
        in GetAllMoviesFromFirestoreUseCase(repository: repository)()) {
      state = AsyncValue.data(state.value!.copyWith(favMovies: favMovies));
      yield favMovies;
    }
  }

  bool isMovieFavourite(String movieId) {
    return CheckFavMovieUsecase()(movieId, state.value!.favMovies);
  }
}

final readmoreProvider = StateProvider<bool>((ref) {
  return false;
});
