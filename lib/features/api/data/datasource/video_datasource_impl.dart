import 'package:dio/dio.dart';
import 'package:movie_app_auth/core/constants/api_constants.dart';
import 'package:movie_app_auth/features/api/data/datasource/video_datasource.dart';
import 'package:movie_app_auth/features/api/data/model/video_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_datasource_impl.g.dart';

class VideoDataSourceImpl implements VideoDataSource {
  final dio = Dio();
  final token = ApiConstants.token;
  @override
  Future<VideoModel> getdata(String id) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response =
        await dio.get('https://api.themoviedb.org/3/movie/$id/videos');
    return VideoModel.fromJson(response.data);
  }
}

@riverpod
VideoDataSource videoDs(VideoDsRef ref) {
  return VideoDataSourceImpl();
}
