// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpResponse _$UserSignUpResponseFromJson(Map<String, dynamic> json) =>
    UserSignUpResponse(
      name: json['name'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserSignUpResponseToJson(UserSignUpResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
    };
