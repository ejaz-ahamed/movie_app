import 'package:movie_app_auth/features/api/data/datasource/video_datasource.dart';
import 'package:movie_app_auth/features/api/data/datasource/video_datasource_impl.dart';
import 'package:movie_app_auth/features/api/domain/entity/video_entity.dart';
import 'package:movie_app_auth/features/api/domain/repository/video_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_repository_impl.g.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoDataSource dataSource;
  VideoRepositoryImpl({required this.dataSource});

  @override
  Future<List<VideoEntity>> getData(String id) async {
    final data = await dataSource.getdata(id);
    late List<VideoEntity> results;

    results = [
      for (final model in data.results)
        VideoEntity(name: model.name, key: model.key, type: model.type)
    ];
    return results;
  }
}

@riverpod
VideoRepository videorepo(VideorepoRef ref) {
  return VideoRepositoryImpl(dataSource: ref.watch(videoDsProvider));
}