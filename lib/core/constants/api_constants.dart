import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api_constants.g.dart';

class ApiConstants {
  static const token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOTFjM2VhZjVlOTQ1OGRlZmE5MDY5NWIzNWM2YWFmMCIsInN1YiI6IjY1ODE4YjQyYmYwZjYzMDg5MzYyYTQzNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._RBNpkOPbuEhq53S9WsNL15hqIUy0YIZD87rCS4jSrU';
  static const imagePath = 'https://image.tmdb.org/t/p/original';
}

@riverpod
ApiConstants apiConst(ApiConstRef ref) {
  return ApiConstants();
}
