// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as int?,
      roleId: json['roleId'] as int? ?? 2,
      state: json['state'] as int? ?? 1,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      patronymic: json['patronymic'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String? ?? '',
      userData: json['userData'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'roleId': instance.roleId,
      'state': instance.state,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'patronymic': instance.patronymic,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'userData': instance.userData,
    };
