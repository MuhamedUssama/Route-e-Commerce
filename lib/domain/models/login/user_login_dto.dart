class UserLoginDto {
  String? name;
  String? email;
  String? role;

  UserLoginDto({
    this.name,
    this.email,
    this.role,
  });

  UserLoginDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  UserLoginDto copyWith({
    String? name,
    String? email,
    String? role,
  }) =>
      UserLoginDto(
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
}
