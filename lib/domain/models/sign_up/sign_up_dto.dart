import 'package:json_annotation/json_annotation.dart';
import 'user_sign_up_dto.dart';

part 'sign_up_dto.g.dart';

@JsonSerializable()
class SignUpDto {
  String? message;
  UserSignUpDto? user;
  String? token;

  SignUpDto({
    this.message,
    this.user,
    this.token,
  });

  factory SignUpDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpDtoToJson(this);
}
