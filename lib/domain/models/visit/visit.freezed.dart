// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Visit {
  int get visitId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get patientId => throw _privateConstructorUsedError;
  int get protocolId => throw _privateConstructorUsedError;
  String get protocolData => throw _privateConstructorUsedError;
  DateTime get visitDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VisitCopyWith<Visit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitCopyWith<$Res> {
  factory $VisitCopyWith(Visit value, $Res Function(Visit) then) =
      _$VisitCopyWithImpl<$Res, Visit>;
  @useResult
  $Res call(
      {int visitId,
      int userId,
      int patientId,
      int protocolId,
      String protocolData,
      DateTime visitDate});
}

/// @nodoc
class _$VisitCopyWithImpl<$Res, $Val extends Visit>
    implements $VisitCopyWith<$Res> {
  _$VisitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitId = null,
    Object? userId = null,
    Object? patientId = null,
    Object? protocolId = null,
    Object? protocolData = null,
    Object? visitDate = null,
  }) {
    return _then(_value.copyWith(
      visitId: null == visitId
          ? _value.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      protocolId: null == protocolId
          ? _value.protocolId
          : protocolId // ignore: cast_nullable_to_non_nullable
              as int,
      protocolData: null == protocolData
          ? _value.protocolData
          : protocolData // ignore: cast_nullable_to_non_nullable
              as String,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VisitImplCopyWith<$Res> implements $VisitCopyWith<$Res> {
  factory _$$VisitImplCopyWith(
          _$VisitImpl value, $Res Function(_$VisitImpl) then) =
      __$$VisitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int visitId,
      int userId,
      int patientId,
      int protocolId,
      String protocolData,
      DateTime visitDate});
}

/// @nodoc
class __$$VisitImplCopyWithImpl<$Res>
    extends _$VisitCopyWithImpl<$Res, _$VisitImpl>
    implements _$$VisitImplCopyWith<$Res> {
  __$$VisitImplCopyWithImpl(
      _$VisitImpl _value, $Res Function(_$VisitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitId = null,
    Object? userId = null,
    Object? patientId = null,
    Object? protocolId = null,
    Object? protocolData = null,
    Object? visitDate = null,
  }) {
    return _then(_$VisitImpl(
      visitId: null == visitId
          ? _value.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      protocolId: null == protocolId
          ? _value.protocolId
          : protocolId // ignore: cast_nullable_to_non_nullable
              as int,
      protocolData: null == protocolData
          ? _value.protocolData
          : protocolData // ignore: cast_nullable_to_non_nullable
              as String,
      visitDate: null == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$VisitImpl implements _Visit {
  const _$VisitImpl(
      {required this.visitId,
      required this.userId,
      required this.patientId,
      required this.protocolId,
      required this.protocolData,
      required this.visitDate});

  @override
  final int visitId;
  @override
  final int userId;
  @override
  final int patientId;
  @override
  final int protocolId;
  @override
  final String protocolData;
  @override
  final DateTime visitDate;

  @override
  String toString() {
    return 'Visit(visitId: $visitId, userId: $userId, patientId: $patientId, protocolId: $protocolId, protocolData: $protocolData, visitDate: $visitDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitImpl &&
            (identical(other.visitId, visitId) || other.visitId == visitId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.protocolId, protocolId) ||
                other.protocolId == protocolId) &&
            (identical(other.protocolData, protocolData) ||
                other.protocolData == protocolData) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, visitId, userId, patientId,
      protocolId, protocolData, visitDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitImplCopyWith<_$VisitImpl> get copyWith =>
      __$$VisitImplCopyWithImpl<_$VisitImpl>(this, _$identity);
}

abstract class _Visit implements Visit {
  const factory _Visit(
      {required final int visitId,
      required final int userId,
      required final int patientId,
      required final int protocolId,
      required final String protocolData,
      required final DateTime visitDate}) = _$VisitImpl;

  @override
  int get visitId;
  @override
  int get userId;
  @override
  int get patientId;
  @override
  int get protocolId;
  @override
  String get protocolData;
  @override
  DateTime get visitDate;
  @override
  @JsonKey(ignore: true)
  _$$VisitImplCopyWith<_$VisitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
