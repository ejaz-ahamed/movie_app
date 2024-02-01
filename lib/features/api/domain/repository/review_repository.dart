import 'package:movie_app_auth/features/api/domain/entity/review_entity.dart';

abstract class ReviewRepository {
  Future<void> addReview(ReviewEntity entity);
  Future<void> delReview(String id);
  Stream<List<ReviewEntity>> getReview(String id);
}
