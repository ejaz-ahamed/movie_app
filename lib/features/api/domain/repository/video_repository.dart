import 'package:movie_app_auth/features/api/domain/entity/video_entity.dart';

abstract class VideoRepository {
  Future<List<VideoEntity>> getData(String id);
}
