import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_auth/features/api/data/model/review_model.dart';

abstract class ReviewDataSource {
  Future<void> addReview(FireStoreReviewModel model);
  Future<void> delReview(String id);
  Stream<QuerySnapshot<FireStoreReviewModel>> getReview(String id);
}
