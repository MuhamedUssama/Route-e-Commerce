import 'user_login_dto.dart';

class LoginDto {
  String? message;
  UserLoginDto? user;
  String? token;

  LoginDto({
    this.message,
    this.user,
    this.token,
  });

  LoginDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserLoginDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  LoginDto copyWith({
    String? message,
    UserLoginDto? user,
    String? token,
  }) =>
      LoginDto(
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
