import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed() //copyWith: true
class User with _$User {
  const factory User({
    int? userId,
    @Default(2) int roleId,
    @Default(1) int state,
    required String firstname,
    required String lastname,
    String? patronymic,
    String? phone,
    String? email,
    @Default('') String password,
    // String? login,
    String? userData,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
