// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'protocol.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Protocol {
  int get protocolId => throw _privateConstructorUsedError;
  int get state => throw _privateConstructorUsedError;
  String get scheme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProtocolCopyWith<Protocol> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtocolCopyWith<$Res> {
  factory $ProtocolCopyWith(Protocol value, $Res Function(Protocol) then) =
      _$ProtocolCopyWithImpl<$Res, Protocol>;
  @useResult
  $Res call({int protocolId, int state, String scheme});
}

/// @nodoc
class _$ProtocolCopyWithImpl<$Res, $Val extends Protocol>
    implements $ProtocolCopyWith<$Res> {
  _$ProtocolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protocolId = null,
    Object? state = null,
    Object? scheme = null,
  }) {
    return _then(_value.copyWith(
      protocolId: null == protocolId
          ? _value.protocolId
          : protocolId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
      scheme: null == scheme
          ? _value.scheme
          : scheme // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProtocolImplCopyWith<$Res>
    implements $ProtocolCopyWith<$Res> {
  factory _$$ProtocolImplCopyWith(
          _$ProtocolImpl value, $Res Function(_$ProtocolImpl) then) =
      __$$ProtocolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int protocolId, int state, String scheme});
}

/// @nodoc
class __$$ProtocolImplCopyWithImpl<$Res>
    extends _$ProtocolCopyWithImpl<$Res, _$ProtocolImpl>
    implements _$$ProtocolImplCopyWith<$Res> {
  __$$ProtocolImplCopyWithImpl(
      _$ProtocolImpl _value, $Res Function(_$ProtocolImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? protocolId = null,
    Object? state = null,
    Object? scheme = null,
  }) {
    return _then(_$ProtocolImpl(
      protocolId: null == protocolId
          ? _value.protocolId
          : protocolId // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int,
      scheme: null == scheme
          ? _value.scheme
          : scheme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProtocolImpl implements _Protocol {
  const _$ProtocolImpl(
      {required this.protocolId, required this.state, required this.scheme});

  @override
  final int protocolId;
  @override
  final int state;
  @override
  final String scheme;

  @override
  String toString() {
    return 'Protocol(protocolId: $protocolId, state: $state, scheme: $scheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtocolImpl &&
            (identical(other.protocolId, protocolId) ||
                other.protocolId == protocolId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.scheme, scheme) || other.scheme == scheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, protocolId, state, scheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtocolImplCopyWith<_$ProtocolImpl> get copyWith =>
      __$$ProtocolImplCopyWithImpl<_$ProtocolImpl>(this, _$identity);
}

abstract class _Protocol implements Protocol {
  const factory _Protocol(
      {required final int protocolId,
      required final int state,
      required final String scheme}) = _$ProtocolImpl;

  @override
  int get protocolId;
  @override
  int get state;
  @override
  String get scheme;
  @override
  @JsonKey(ignore: true)
  _$$ProtocolImplCopyWith<_$ProtocolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
