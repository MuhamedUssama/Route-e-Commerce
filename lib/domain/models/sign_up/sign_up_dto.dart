import 'user_sign_up_dto.dart';

class SignUpDto {
  String? message;
  UserSignUpDto? user;
  String? token;

  SignUpDto({
    this.message,
    this.user,
    this.token,
  });

  SignUpDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserSignUpDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  SignUpDto copyWith({
    String? message,
    UserSignUpDto? user,
    String? token,
  }) =>
      SignUpDto(
        message: message ?? this.message,
        user: user ?? this.user,
        token: token ?? this.token,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}
