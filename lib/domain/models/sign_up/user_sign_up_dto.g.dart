// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpDto _$UserSignUpDtoFromJson(Map<String, dynamic> json) =>
    UserSignUpDto(
      name: json['name'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserSignUpDtoToJson(UserSignUpDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
    };
