// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atlas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Atlas {
  int get atlasId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get tree => throw _privateConstructorUsedError;
  int get isPublic => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AtlasCopyWith<Atlas> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtlasCopyWith<$Res> {
  factory $AtlasCopyWith(Atlas value, $Res Function(Atlas) then) =
      _$AtlasCopyWithImpl<$Res, Atlas>;
  @useResult
  $Res call({int atlasId, int userId, String title, String tree, int isPublic});
}

/// @nodoc
class _$AtlasCopyWithImpl<$Res, $Val extends Atlas>
    implements $AtlasCopyWith<$Res> {
  _$AtlasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atlasId = null,
    Object? userId = null,
    Object? title = null,
    Object? tree = null,
    Object? isPublic = null,
  }) {
    return _then(_value.copyWith(
      atlasId: null == atlasId
          ? _value.atlasId
          : atlasId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tree: null == tree
          ? _value.tree
          : tree // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtlasImplCopyWith<$Res> implements $AtlasCopyWith<$Res> {
  factory _$$AtlasImplCopyWith(
          _$AtlasImpl value, $Res Function(_$AtlasImpl) then) =
      __$$AtlasImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int atlasId, int userId, String title, String tree, int isPublic});
}

/// @nodoc
class __$$AtlasImplCopyWithImpl<$Res>
    extends _$AtlasCopyWithImpl<$Res, _$AtlasImpl>
    implements _$$AtlasImplCopyWith<$Res> {
  __$$AtlasImplCopyWithImpl(
      _$AtlasImpl _value, $Res Function(_$AtlasImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? atlasId = null,
    Object? userId = null,
    Object? title = null,
    Object? tree = null,
    Object? isPublic = null,
  }) {
    return _then(_$AtlasImpl(
      atlasId: null == atlasId
          ? _value.atlasId
          : atlasId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tree: null == tree
          ? _value.tree
          : tree // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AtlasImpl implements _Atlas {
  const _$AtlasImpl(
      {required this.atlasId,
      required this.userId,
      required this.title,
      required this.tree,
      required this.isPublic});

  @override
  final int atlasId;
  @override
  final int userId;
  @override
  final String title;
  @override
  final String tree;
  @override
  final int isPublic;

  @override
  String toString() {
    return 'Atlas(atlasId: $atlasId, userId: $userId, title: $title, tree: $tree, isPublic: $isPublic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AtlasImpl &&
            (identical(other.atlasId, atlasId) || other.atlasId == atlasId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tree, tree) || other.tree == tree) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, atlasId, userId, title, tree, isPublic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AtlasImplCopyWith<_$AtlasImpl> get copyWith =>
      __$$AtlasImplCopyWithImpl<_$AtlasImpl>(this, _$identity);
}

abstract class _Atlas implements Atlas {
  const factory _Atlas(
      {required final int atlasId,
      required final int userId,
      required final String title,
      required final String tree,
      required final int isPublic}) = _$AtlasImpl;

  @override
  int get atlasId;
  @override
  int get userId;
  @override
  String get title;
  @override
  String get tree;
  @override
  int get isPublic;
  @override
  @JsonKey(ignore: true)
  _$$AtlasImplCopyWith<_$AtlasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
