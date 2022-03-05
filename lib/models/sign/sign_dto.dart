class SignDto {
  String token;

  String userKey;
  String email;
  String password;

  String nickname;

  SignDto({
    this.token = "",
    this.userKey = "",
    this.email = "",
    this.password = "",
    this.nickname = ""
  });

  factory SignDto.fromJson(Map<String, dynamic> json) {
    return SignDto(
      token: json["token"] ?? "",
      userKey: json["userKey"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      nickname: json["nickname"] ?? "",
    );
  }
}