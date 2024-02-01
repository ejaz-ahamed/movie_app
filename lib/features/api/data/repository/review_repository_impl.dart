import 'package:movie_app_auth/features/api/data/datasource/review_datasource.dart';
import 'package:movie_app_auth/features/api/data/datasource/review_datasource_impl.dart';
import 'package:movie_app_auth/features/api/data/model/review_model.dart';
import 'package:movie_app_auth/features/api/domain/entity/review_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/review_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_repository_impl.g.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewDataSource dataSource;
  ReviewRepositoryImpl({required this.dataSource});

  @override
  Future<void> addReview(ReviewEntity entity) async {
    final docs = FireStoreReviewModel(
      review: entity.review,
      movieId: entity.movieId,
    );
    await dataSource.addReview(docs);
  }

  @override
  Future<void> delReview(String id) async {
    await dataSource.delReview(id);
  }

  @override
  Stream<List<ReviewEntity>> getReview(String id) async* {
    final ds = dataSource.getReview(id);
    await for (final d in ds) {
      final data = d.docs;
      yield [
        for (final i in data)
          ReviewEntity(
              review: i.data().review, movieId: i.data().movieId, id: i.id)
      ];
    }
  }
}

@riverpod
ReviewRepository reviewRepository(ReviewRepositoryRef ref) {
  return ReviewRepositoryImpl(dataSource: ref.watch(reviewDataSourceProvider));
}
