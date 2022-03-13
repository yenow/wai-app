import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:wai/data/model/sign.dart';
import 'package:wai/models/api/response_dto.dart';
import 'package:wai/data/model/enneagram.dart';
import 'package:wai/data/model/enneagram_test.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/data/dto/user_request_dto.dart';

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

  UserRequestDto toUserRequestDto() {
    return UserRequestDto(userKey: userKey);
  }

  String toJson() {
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
  }

  @override
  String toString() {
    return 'User{userId: $userId, userKey: $userKey, password: $password, nickname: $nickname, email: $email, myEnneagramType: $myEnneagramType}';
  }
}