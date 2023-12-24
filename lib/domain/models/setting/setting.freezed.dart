// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Setting {
  int get settingId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get param => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingCopyWith<Setting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingCopyWith<$Res> {
  factory $SettingCopyWith(Setting value, $Res Function(Setting) then) =
      _$SettingCopyWithImpl<$Res, Setting>;
  @useResult
  $Res call({int settingId, int userId, String param, String value});
}

/// @nodoc
class _$SettingCopyWithImpl<$Res, $Val extends Setting>
    implements $SettingCopyWith<$Res> {
  _$SettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingId = null,
    Object? userId = null,
    Object? param = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      settingId: null == settingId
          ? _value.settingId
          : settingId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      param: null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingImplCopyWith<$Res> implements $SettingCopyWith<$Res> {
  factory _$$SettingImplCopyWith(
          _$SettingImpl value, $Res Function(_$SettingImpl) then) =
      __$$SettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int settingId, int userId, String param, String value});
}

/// @nodoc
class __$$SettingImplCopyWithImpl<$Res>
    extends _$SettingCopyWithImpl<$Res, _$SettingImpl>
    implements _$$SettingImplCopyWith<$Res> {
  __$$SettingImplCopyWithImpl(
      _$SettingImpl _value, $Res Function(_$SettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingId = null,
    Object? userId = null,
    Object? param = null,
    Object? value = null,
  }) {
    return _then(_$SettingImpl(
      settingId: null == settingId
          ? _value.settingId
          : settingId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      param: null == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingImpl implements _Setting {
  const _$SettingImpl(
      {required this.settingId,
      required this.userId,
      required this.param,
      required this.value});

  @override
  final int settingId;
  @override
  final int userId;
  @override
  final String param;
  @override
  final String value;

  @override
  String toString() {
    return 'Setting(settingId: $settingId, userId: $userId, param: $param, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingImpl &&
            (identical(other.settingId, settingId) ||
                other.settingId == settingId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.param, param) || other.param == param) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settingId, userId, param, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingImplCopyWith<_$SettingImpl> get copyWith =>
      __$$SettingImplCopyWithImpl<_$SettingImpl>(this, _$identity);
}

abstract class _Setting implements Setting {
  const factory _Setting(
      {required final int settingId,
      required final int userId,
      required final String param,
      required final String value}) = _$SettingImpl;

  @override
  int get settingId;
  @override
  int get userId;
  @override
  String get param;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$SettingImplCopyWith<_$SettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
