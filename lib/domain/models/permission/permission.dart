import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission.freezed.dart';
// part 'permission.g.dart';

@Freezed(copyWith: false, equal: false, toStringOverride: false)
class Permission with _$Permission {
  const factory Permission({
    int? permissionId,
    required int roleId,
    required String objectName,
    required int createNew,
    required int readOwn,
    required int editOwn,
    required int readAll,
    required int editAll,
  }) = _Permission;
}
