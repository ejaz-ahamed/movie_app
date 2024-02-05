import 'package:dio/dio.dart';
import 'package:movie_app_auth/core/constants/api_constants.dart';
import 'package:movie_app_auth/core/object_box/movie_objectbox.dart';
import 'package:movie_app_auth/features/api/data/datasource/objectbox_datasource.dart';
import 'package:movie_app_auth/features/api/data/model/movie_objectbox_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectbox_datasource_impl.g.dart';

class ObjectBoxDataSourceImpl implements ObjectBoxDataSource {
  final box = MovieObjectBox.instance.movieBox;

  @override
  void addMovies(List<MovieEntityModel> entityModel) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.imagePath));
    final cacheDirectory =
        '${(await getApplicationDocumentsDirectory()).path}/cahced_images';
    for (final movie in entityModel) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backdropPathLocation = '$cacheDirectory${movie.backdropPath}';
      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backdropPathLocation);
      movie.posterPath = posterPathLocation;
      movie.backdropPath = backdropPathLocation;
    }
    box.putMany(entityModel);
  }

  @override
  List<MovieEntityModel> getAllMovies() {
    return box.getAll();
  }

  @override
  void clearAll() {
    box.removeAll();
  }
}

@riverpod
ObjectBoxDataSource objDataSource(ObjDataSourceRef ref) {
  return ObjectBoxDataSourceImpl();
}
