import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_auth/features/api/data/datasource/review_datasource.dart';
import 'package:movie_app_auth/features/api/data/model/review_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_datasource_impl.g.dart';

class ReviewDataSourceImpl implements ReviewDataSource {
  final collection = FirebaseFirestore.instance
      .collection("Reviews")
      .withConverter(
          fromFirestore: FireStoreReviewModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> addReview(FireStoreReviewModel model) async {
    await collection.add(model);
  }

  @override
  Future<void> delReview(String id) async {
    await collection.doc(id).delete();
  }

  @override
  Stream<QuerySnapshot<FireStoreReviewModel>> getReview(String movieId) {
    return collection.where('movieId', isEqualTo: movieId).snapshots();
  }
}

@riverpod
ReviewDataSource reviewDataSource(ReviewDataSourceRef ref) {
  return ReviewDataSourceImpl();
}
