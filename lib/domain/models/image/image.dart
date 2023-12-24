import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';
// part 'image.g.dart';

@Freezed()
class Image with _$Image {
  const factory Image({
    required int imageId,
    required int width,
    required int height,
    required String format,
    Uint8List? imageData,
  }) = _Image;
}
