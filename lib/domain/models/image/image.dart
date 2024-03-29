import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
// part 'image.g.dart';

@Freezed(copyWith: false, equal: false, toStringOverride: false)
class Image with _$Image {
  const factory Image({
    int? imageId,
    required int width,
    required int height,
    required String format,
    required Uint8List imageData,
  }) = _Image;
}
