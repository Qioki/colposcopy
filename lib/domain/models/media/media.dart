import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
// part 'media.g.dart';

@Freezed()
class Media with _$Media {
  const factory Media({
    required int mediaId,
    required int visitId,
    required int mediaType,
    required int imageId,
    String? filePath,
    required int thumbnailId,
    required int listNumber,
    String? notes,
    String? mediaData,
    String? modification,
    String? reportData,
  }) = _Media;
}
