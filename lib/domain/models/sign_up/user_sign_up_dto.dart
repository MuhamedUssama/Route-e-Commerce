class UserSignUpDto {
  String? name;
  String? email;
  String? role;

  UserSignUpDto({
    this.name,
    this.email,
    this.role,
  });

  UserSignUpDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  UserSignUpDto copyWith({
    String? name,
    String? email,
    String? role,
  }) =>
      UserSignUpDto(
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
