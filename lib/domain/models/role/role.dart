import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';
// part 'role.g.dart';

@Freezed()
class Role with _$Role {
  const factory Role({
    required int roleId,
    required String name,
  }) = _Role;
}
