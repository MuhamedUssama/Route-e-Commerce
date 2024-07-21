import '../../../domain/models/login/user_login_dto.dart';

class UserLoginResponse {
  String? name;
  String? email;
  String? role;

  UserLoginResponse({
    this.name,
    this.email,
    this.role,
  });

  UserLoginResponse.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  UserLoginResponse copyWith({
    String? name,
    String? email,
    String? role,
  }) =>
      UserLoginResponse(
        name: name ?? this.name,
        email: email ?? this.email,
        role: role ?? this.role,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserLoginDto toUserLoginDto() {
    return UserLoginDto(
      email: email,
      name: name,
      role: role,
    );
  }
}
