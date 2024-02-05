import 'package:dio/dio.dart';
import 'package:movie_app_auth/core/exceptions/base_exception.dart';
import 'package:movie_app_auth/features/api/domain/entity/video_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/video_repository.dart';

final class VideoUseCase {
  final VideoRepository repository;
  VideoUseCase({required this.repository});

  Future<List<VideoEntity>> call(String id) async {
    try {
      final videos = await repository.getData(id);
      final trailers = videos
          .where((video) => video.type.toLowerCase().trim() == 'trailer')
          .toList();
      return trailers;
    } catch (e) {
      throw BaseException('Error while loading \n ${(e is DioException) ? e.type : e}');
    }
  }
}
