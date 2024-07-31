import '../../../domain/models/login/login_dto.dart';
import 'user_login_response.dart';

class LoginResponse {
  String? message;
  UserLoginResponse? user;
  String? token;

  LoginResponse({
    this.message,
    this.user,
    this.token,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user =
        json['user'] != null ? UserLoginResponse.fromJson(json['user']) : null;
    token = json['token'];
  }

  LoginResponse copyWith({
    String? message,
    UserLoginResponse? user,
    String? token,
  }) =>
      LoginResponse(
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

  LoginDto toLoginDto() {
    return LoginDto(
      message: message,
      token: token,
      user: user?.toUserLoginDto(),
    );
  }
}
