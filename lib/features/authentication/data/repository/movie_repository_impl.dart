import 'package:movie_app_auth/features/authentication/data/datasource/apiservices_datasource.dart';
import 'package:movie_app_auth/features/authentication/domain/entity/movie_entity.dart';
import 'package:movie_app_auth/features/authentication/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiServicesDataSource dataSource;
  MovieRepositoryImpl({required this.dataSource});

  @override
  Future<List<MovieEntity>> getMovies() async {
    return [];
  }
}
