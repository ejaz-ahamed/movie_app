import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_entity.freezed.dart';

@freezed
class ReviewEntity with _$ReviewEntity {
  factory ReviewEntity({
    required String review,
    required String id,
    required String movieId,
  }) = _ReviewEntity;
}
