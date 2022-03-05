import 'dart:convert';

class Sign {
  int userId;
  String userKey;
  String? email;
  String password;
  String token;

  Sign({
    required this.userId,
    this.userKey = "",
    this.email = "",
    this.password = "",
    this.token = "",
  });

  String toJson() {
    return json.encode({
      "userId": userId,
      "userKey": userKey,
      "email": email,
      "password": password,
      "token": token,
    });
  }

  factory Sign.fromJson(Map<String, dynamic> json) {
    return Sign(
      userId: json["userId"],
      userKey: json["userKey"] ?? "",
      email: json["email"],
      password: json["password"] ?? "",
      token: json["token"] ?? "",
    );
  }

  @override
  String toString() {
    return 'Sign{userId: $userId, userKey: $userKey, email: $email, password: $password, token: $token}';
  }
}