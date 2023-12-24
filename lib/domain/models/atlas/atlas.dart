import 'package:freezed_annotation/freezed_annotation.dart';

part 'atlas.freezed.dart';
// part 'atlas.g.dart';

@Freezed()
class Atlas with _$Atlas {
  const factory Atlas({
    required int atlasId,
    required int userId,
    required String title,
    required String tree,
    required int isPublic,
  }) = _Atlas;
}
