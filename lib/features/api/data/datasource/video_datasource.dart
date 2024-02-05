import 'package:movie_app_auth/features/api/data/model/video_model.dart';

abstract class VideoDataSource {
  Future<VideoModel> getdata(String id);
}
