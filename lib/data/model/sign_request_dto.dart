import 'dart:convert';

class SignRequestDto {
  String token;

  String userKey;
  String email;
  String password;

  String nickname;

  SignRequestDto({
    this.token = "",
    this.userKey = "",
    this.email = "",
    this.password = "",
    this.nickname = ""
  });

  String toJson() {
    return json.encode({
      "token" : token,
      "userKey" : userKey,
      "email" : email,
      "password" : password,
      "nickname" : nickname,
    });
  }
}