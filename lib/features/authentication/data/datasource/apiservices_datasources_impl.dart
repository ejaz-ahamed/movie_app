import 'package:dio/dio.dart';
import 'package:movie_app_auth/core/constants/api_constants.dart';
import 'package:movie_app_auth/features/authentication/data/datasource/apiservices_datasource.dart';
import 'package:movie_app_auth/features/authentication/data/model/movieapi_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apiservices_datasources_impl.g.dart';

class ApiServicesDataSourceImpl implements ApiServicesDataSource {
  static final dio = Dio();
  final token = ApiConstants.token;
  @override
  Future<MovieModel> getMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc");
    return response.data;
  }
}

@riverpod
ApiServicesDataSource apiDataSource(ApiDataSourceRef ref) {
  return ApiServicesDataSourceImpl();
}
