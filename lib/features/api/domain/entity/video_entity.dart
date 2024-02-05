import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_entity.freezed.dart';

@freezed
class VideoEntity with _$VideoEntity {
  factory VideoEntity({
    required String name,
    required String key,
    required String type,
  }) = _VideoEntity;
}
