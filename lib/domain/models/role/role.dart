import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';
// part 'role.g.dart';

@Freezed(copyWith: false, equal: false, toStringOverride: false)
class Role with _$Role {
  const factory Role({
    int? roleId,
    required String name,
  }) = _Role;
}
