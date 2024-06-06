import '../../../domain/models/sign_up/user_sign_up_dto.dart';

class UserSignUpResponse {
  String? name;
  String? email;
  String? role;

  UserSignUpResponse({
    this.name,
    this.email,
    this.role,
  });

  UserSignUpResponse.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  UserSignUpResponse copyWith({
    String? name,
    String? email,
    String? role,
  }) =>
      UserSignUpResponse(
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

  UserSignUpDto toUserDto() {
    return UserSignUpDto(
      email: email,
      name: name,
      role: role,
    );
  }
}
