import '../../../domain/models/sign_up/sign_up_dto.dart';
import 'user_sign_up_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? message;
  UserSignUpResponse? user;
  String? token;

  SignUpResponse({
    this.message,
    this.user,
    this.token,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

  SignUpDto toSignUpDto() {
    return SignUpDto(
      message: message,
      token: token,
      user: user?.toUserDto(),
    );
  }
}
