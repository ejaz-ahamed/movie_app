import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/api/domain/repository/review_repository.dart';

final class DeleteReviewUseCase {
  final ReviewRepository repository;
  DeleteReviewUseCase({required this.repository});

  Future<void> call(String id) async {
    try {
      await repository.delReview(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
