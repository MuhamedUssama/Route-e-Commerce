import '../../../domain/models/sign_up/user_sign_up_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up_response.g.dart';

@JsonSerializable()
class UserSignUpResponse {
  String? name;
  String? email;
  String? role;

  UserSignUpResponse({
    this.name,
    this.email,
    this.role,
  });

  factory UserSignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpResponseToJson(this);

  UserSignUpDto toUserDto() {
    return UserSignUpDto(
      email: email,
      name: name,
      role: role,
    );
  }
}
