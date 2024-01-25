import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_auth/features/api/domain/entity/movie_entity.dart';

part 'movie_provider_state.freezed.dart';

@freezed
class MovieProviderState with _$MovieProviderState {
  factory MovieProviderState({
    required List<MovieEntity> getMovies,
    required List<MovieEntity> toprated,
  }) = _MovieProviderState;
}
