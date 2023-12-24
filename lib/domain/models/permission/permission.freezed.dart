// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Permission {
  int get permissionId => throw _privateConstructorUsedError;
  int get roleId => throw _privateConstructorUsedError;
  String get objectName => throw _privateConstructorUsedError;
  int get createNew => throw _privateConstructorUsedError;
  int get readOwn => throw _privateConstructorUsedError;
  int get editOwn => throw _privateConstructorUsedError;
  int get readAll => throw _privateConstructorUsedError;
  int get editAll => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionCopyWith<Permission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCopyWith<$Res> {
  factory $PermissionCopyWith(
          Permission value, $Res Function(Permission) then) =
      _$PermissionCopyWithImpl<$Res, Permission>;
  @useResult
  $Res call(
      {int permissionId,
      int roleId,
      String objectName,
      int createNew,
      int readOwn,
      int editOwn,
      int readAll,
      int editAll});
}

/// @nodoc
class _$PermissionCopyWithImpl<$Res, $Val extends Permission>
    implements $PermissionCopyWith<$Res> {
  _$PermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionId = null,
    Object? roleId = null,
    Object? objectName = null,
    Object? createNew = null,
    Object? readOwn = null,
    Object? editOwn = null,
    Object? readAll = null,
    Object? editAll = null,
  }) {
    return _then(_value.copyWith(
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      objectName: null == objectName
          ? _value.objectName
          : objectName // ignore: cast_nullable_to_non_nullable
              as String,
      createNew: null == createNew
          ? _value.createNew
          : createNew // ignore: cast_nullable_to_non_nullable
              as int,
      readOwn: null == readOwn
          ? _value.readOwn
          : readOwn // ignore: cast_nullable_to_non_nullable
              as int,
      editOwn: null == editOwn
          ? _value.editOwn
          : editOwn // ignore: cast_nullable_to_non_nullable
              as int,
      readAll: null == readAll
          ? _value.readAll
          : readAll // ignore: cast_nullable_to_non_nullable
              as int,
      editAll: null == editAll
          ? _value.editAll
          : editAll // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionImplCopyWith<$Res>
    implements $PermissionCopyWith<$Res> {
  factory _$$PermissionImplCopyWith(
          _$PermissionImpl value, $Res Function(_$PermissionImpl) then) =
      __$$PermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int permissionId,
      int roleId,
      String objectName,
      int createNew,
      int readOwn,
      int editOwn,
      int readAll,
      int editAll});
}

/// @nodoc
class __$$PermissionImplCopyWithImpl<$Res>
    extends _$PermissionCopyWithImpl<$Res, _$PermissionImpl>
    implements _$$PermissionImplCopyWith<$Res> {
  __$$PermissionImplCopyWithImpl(
      _$PermissionImpl _value, $Res Function(_$PermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionId = null,
    Object? roleId = null,
    Object? objectName = null,
    Object? createNew = null,
    Object? readOwn = null,
    Object? editOwn = null,
    Object? readAll = null,
    Object? editAll = null,
  }) {
    return _then(_$PermissionImpl(
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      objectName: null == objectName
          ? _value.objectName
          : objectName // ignore: cast_nullable_to_non_nullable
              as String,
      createNew: null == createNew
          ? _value.createNew
          : createNew // ignore: cast_nullable_to_non_nullable
              as int,
      readOwn: null == readOwn
          ? _value.readOwn
          : readOwn // ignore: cast_nullable_to_non_nullable
              as int,
      editOwn: null == editOwn
          ? _value.editOwn
          : editOwn // ignore: cast_nullable_to_non_nullable
              as int,
      readAll: null == readAll
          ? _value.readAll
          : readAll // ignore: cast_nullable_to_non_nullable
              as int,
      editAll: null == editAll
          ? _value.editAll
          : editAll // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PermissionImpl implements _Permission {
  const _$PermissionImpl(
      {required this.permissionId,
      required this.roleId,
      required this.objectName,
      required this.createNew,
      required this.readOwn,
      required this.editOwn,
      required this.readAll,
      required this.editAll});

  @override
  final int permissionId;
  @override
  final int roleId;
  @override
  final String objectName;
  @override
  final int createNew;
  @override
  final int readOwn;
  @override
  final int editOwn;
  @override
  final int readAll;
  @override
  final int editAll;

  @override
  String toString() {
    return 'Permission(permissionId: $permissionId, roleId: $roleId, objectName: $objectName, createNew: $createNew, readOwn: $readOwn, editOwn: $editOwn, readAll: $readAll, editAll: $editAll)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionImpl &&
            (identical(other.permissionId, permissionId) ||
                other.permissionId == permissionId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.objectName, objectName) ||
                other.objectName == objectName) &&
            (identical(other.createNew, createNew) ||
                other.createNew == createNew) &&
            (identical(other.readOwn, readOwn) || other.readOwn == readOwn) &&
            (identical(other.editOwn, editOwn) || other.editOwn == editOwn) &&
            (identical(other.readAll, readAll) || other.readAll == readAll) &&
            (identical(other.editAll, editAll) || other.editAll == editAll));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permissionId, roleId, objectName,
      createNew, readOwn, editOwn, readAll, editAll);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      __$$PermissionImplCopyWithImpl<_$PermissionImpl>(this, _$identity);
}

abstract class _Permission implements Permission {
  const factory _Permission(
      {required final int permissionId,
      required final int roleId,
      required final String objectName,
      required final int createNew,
      required final int readOwn,
      required final int editOwn,
      required final int readAll,
      required final int editAll}) = _$PermissionImpl;

  @override
  int get permissionId;
  @override
  int get roleId;
  @override
  String get objectName;
  @override
  int get createNew;
  @override
  int get readOwn;
  @override
  int get editOwn;
  @override
  int get readAll;
  @override
  int get editAll;
  @override
  @JsonKey(ignore: true)
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
