import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? userId;
  String userKey;
  String? password;
  String? nickname;
  String? email;
  int? myEnneagramType;

  User({
    this.userId,
    this.userKey = "",
    this.password,
    this.nickname,
    this.email,
    this.myEnneagramType,
  });

  void setUserBySign(Sign sign) {
    userId = sign.userId;
    userKey = sign.userKey;
    nickname = sign.nickname;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{userId: $userId, userKey: $userKey, password: $password, nickname: $nickname, email: $email, myEnneagramType: $myEnneagramType}';
  }
}

  /*String toJson() {
    return json.encode({
      "userId" : userId,
      "userKey" : userKey,
      "nickname" : nickname,
      "email" : email,
      "myEnneagramType" : myEnneagramType,
    });
  }

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      userId: json['userId'],
      userKey: json['userKey'],
      password: json['password'],
      nickname: json['nickname'],
      email: json['email'],
      myEnneagramType: json['myEnneagramType'],
    );
  }*/
