import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_auth/features/api/data/model/firestore_model.dart';

abstract class FavouriteMovieDataSource {
  Future<void> addtoFirestore(FireStoreModel model);
  Future<void> deleteFromFireStore(String id);
  Future<List<FireStoreModel>> getByMovieIdFromFireStore(String movieId);
  Stream<QuerySnapshot<FireStoreModel>> getAllMovies();
}
