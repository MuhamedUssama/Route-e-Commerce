import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  SignUpRequestModel({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
