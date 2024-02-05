// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  factory VideoModel({
    required int id,
    required List<Res> results,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}

@freezed
class Res with _$Res {
  factory Res({
    @JsonKey(name: "iso_639_1") required String iso6391,
    @JsonKey(name: "iso_3166_1") required String iso31661,
    required String name,
    required String key,
    required String site,
    required int size,
    required String type,
    required bool official,
    @JsonKey(name: "published_at") required DateTime publishedAt,
    required String id,
  }) = _Res;

  factory Res.fromJson(Map<String, dynamic> json) => _$ResFromJson(json);
}
