import 'dart:convert';

class LoginInfo {
  String userId;
  String userKey;
  String? email;
  String password;
  String token;

  LoginInfo({
    this.userId = "",
    this.userKey = "",
    this.email = "",
    this.password = "",
    this.token = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userKey": userKey,
      "email": email,
      "password": password,
      "token": token,
    };
  }

  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    return LoginInfo(
      userId: json["userId"] ?? "",
      userKey: json["userKey"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      token: json["token"] ?? "",
    );
  }

  @override
  String toString() {
    return 'LoginInfo{userId: $userId, userKey: $userKey, email: $email, password: $password, token: $token}';
  }
}