import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up_dto.g.dart';

@JsonSerializable()
class UserSignUpDto {
  String? name;
  String? email;
  String? role;

  UserSignUpDto({
    this.name,
    this.email,
    this.role,
  });

  factory UserSignUpDto.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpDtoToJson(this);
}
