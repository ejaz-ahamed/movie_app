import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_auth/features/api/data/datasource/favourite_movie_datasource.dart';
import 'package:movie_app_auth/features/api/data/model/firestore_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_movie_datasource_impl.g.dart';

class FavouriteMovieDataSourceImpl implements FavouriteMovieDataSource {
  final collection = FirebaseFirestore.instance
      .collection("favourite_movie")
      .withConverter(
          fromFirestore: FireStoreModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> addtoFirestore(FireStoreModel model) async {
    await collection.doc(model.id).set(model);
  }

  @override
  Future<void> deleteFromFireStore(String id) async {
    await collection.doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<FireStoreModel>> getAllMovies() {
    return collection.snapshots();
  }

  @override
  Future<List<FireStoreModel>> getByMovieIdFromFireStore(String movieId) async {
    final docs = await collection.where('id', isEqualTo: movieId).get();

    final List<FireStoreModel> movies = [];
    for (final movie in docs.docs) {
      movies.add(movie.data());
    }

    return movies;
  }
}

@riverpod
FavouriteMovieDataSource favMovieDataSource(FavMovieDataSourceRef ref) {
  return FavouriteMovieDataSourceImpl();
}
