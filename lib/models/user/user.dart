enum Gender {
  man, woman
}

extension ParseToString on Gender {
  String get name {
    return this.toString().split('.').last;
  }
}

class User {
  int? userId;
  String? userKey;
  String? password;
  String? email;
  String? phoneNumber;
  String? nickname;
  String? birthDay;
  Gender? gender;

  User({
    this.userId,
      this.userKey,
      this.password,
      this.email,
      this.phoneNumber,
      this.nickname,
      this.birthDay,
      this.gender
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      userKey: json['userKey'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      birthDay: json['birthDay'],
      gender: json['gender'],
    );
  }
}