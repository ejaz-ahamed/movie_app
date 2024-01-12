import 'package:dio/dio.dart';
import 'package:movie_app_auth/features/authentication/data/datasource/apiservices_datasource.dart';
import 'package:movie_app_auth/features/authentication/data/model/movieapi_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apiservices_datasources_impl.g.dart';

class ApiServicesDataSourceImpl implements ApiServicesDataSource {
  static final dio = Dio();
  static const token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOTFjM2VhZjVlOTQ1OGRlZmE5MDY5NWIzNWM2YWFmMCIsInN1YiI6IjY1ODE4YjQyYmYwZjYzMDg5MzYyYTQzNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._RBNpkOPbuEhq53S9WsNL15hqIUy0YIZD87rCS4jSrU';
  @override
  Future<MovieModel?> getMovies() async {
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
