import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/api/domain/entity/review_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/review_repository.dart';

final class AddReviewUseCase {
  final ReviewRepository repository;
  AddReviewUseCase({required this.repository});

  Future<void> call(ReviewEntity entity) async {
    try {
      await repository.addReview(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
