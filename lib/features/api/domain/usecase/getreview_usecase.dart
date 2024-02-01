import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/api/domain/entity/review_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/review_repository.dart';

final class GetReviewUseCase {
  final ReviewRepository repository;
  GetReviewUseCase({required this.repository});

  Stream<List<ReviewEntity>> call(String id) {
    try {
      return repository.getReview(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
