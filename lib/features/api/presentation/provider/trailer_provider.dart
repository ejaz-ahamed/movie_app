import 'package:movie_app_auth/features/api/data/repository/video_repository_impl.dart';
import 'package:movie_app_auth/features/api/domain/entity/video_entity.dart';
import 'package:movie_app_auth/features/api/domain/usecase/video_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trailer_provider.g.dart';

@riverpod
Future<List<VideoEntity>> trailer(TrailerRef ref, String movieId) async {
  return await VideoUseCase(repository: ref.read(videorepoProvider))(
      movieId);
}