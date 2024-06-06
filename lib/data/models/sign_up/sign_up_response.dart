import '../../../domain/models/sign_up/sign_up_dto.dart';
import 'user_sign_up_response.dart';

class SignUpResponse {
  String? message;
  UserSignUpResponse? user;
  String? token;

  SignUpResponse({
    this.message,
    this.user,
    this.token,
  });

  SignUpResponse.fromJson(dynamic json) {
    message = json['message'];
    user =
        json['user'] != null ? UserSignUpResponse.fromJson(json['user']) : null;
    token = json['token'];
  }

  SignUpResponse copyWith({
    String? message,
    UserSignUpResponse? user,
    String? token,
  }) =>
      SignUpResponse(
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

  SignUpDto toSignUpDto() {
    return SignUpDto(
      message: message,
      token: token,
      user: user?.toUserDto(),
    );
  }
}
