// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Image {
  int get imageId => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;
  Uint8List? get imageData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call(
      {int imageId,
      int width,
      int height,
      String format,
      Uint8List? imageData});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? width = null,
    Object? height = null,
    Object? format = null,
    Object? imageData = freezed,
  }) {
    return _then(_value.copyWith(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageImplCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$ImageImplCopyWith(
          _$ImageImpl value, $Res Function(_$ImageImpl) then) =
      __$$ImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int imageId,
      int width,
      int height,
      String format,
      Uint8List? imageData});
}

/// @nodoc
class __$$ImageImplCopyWithImpl<$Res>
    extends _$ImageCopyWithImpl<$Res, _$ImageImpl>
    implements _$$ImageImplCopyWith<$Res> {
  __$$ImageImplCopyWithImpl(
      _$ImageImpl _value, $Res Function(_$ImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? width = null,
    Object? height = null,
    Object? format = null,
    Object? imageData = freezed,
  }) {
    return _then(_$ImageImpl(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$ImageImpl implements _Image {
  const _$ImageImpl(
      {required this.imageId,
      required this.width,
      required this.height,
      required this.format,
      this.imageData});

  @override
  final int imageId;
  @override
  final int width;
  @override
  final int height;
  @override
  final String format;
  @override
  final Uint8List? imageData;

  @override
  String toString() {
    return 'Image(imageId: $imageId, width: $width, height: $height, format: $format, imageData: $imageData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageImpl &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.format, format) || other.format == format) &&
            const DeepCollectionEquality().equals(other.imageData, imageData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageId, width, height, format,
      const DeepCollectionEquality().hash(imageData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      __$$ImageImplCopyWithImpl<_$ImageImpl>(this, _$identity);
}

abstract class _Image implements Image {
  const factory _Image(
      {required final int imageId,
      required final int width,
      required final int height,
      required final String format,
      final Uint8List? imageData}) = _$ImageImpl;

  @override
  int get imageId;
  @override
  int get width;
  @override
  int get height;
  @override
  String get format;
  @override
  Uint8List? get imageData;
  @override
  @JsonKey(ignore: true)
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
