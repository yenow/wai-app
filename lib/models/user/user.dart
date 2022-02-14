import 'package:enum_to_string/enum_to_string.dart';
import 'package:wai/models/api/response_dto.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/models/user/api/user_request_dto.dart';

enum Gender {
  man, woman
}

extension ParseToString on Gender {
  String get name {
    return this.toString().split('.').last;
  }
}

class User extends ResponseDto{
  int? userId;
  String? userKey;
  String? password;
  String? nickname;
  String? email;
  String? phoneNumber;
  String? birthDay;
  Gender? gender;
  int? myEnneagramType;

  List<Post>? posts = [];
  List<Reply>? replys = [];
  List<EnneagramTest>? enneagramTests = [];

  User({
    this.userId,
    this.userKey,
    this.password,
    this.nickname,
    this.email,
    this.phoneNumber,
    this.birthDay,
    this.gender,
    this.myEnneagramType,
    this.posts,
    this.replys,
    this.enneagramTests,
  });

  UserRequestDto toUserRequestDto() {
    return UserRequestDto(userId: userId!, userKey: userKey!);
  }

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      userId: json['userId'],
      userKey: json['userKey'],
      password: json['password'],
      nickname: json['nickname'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      birthDay: json['birthDay'],
      // gender: EnumToString.fromString(Gender.values, (json['gender'] ?? "") as String),
      myEnneagramType: json['myEnneagramType'],
      posts: List<Post>.from((json['posts'] ?? []).map((model) {
        model.containsKey('user') ? model.update('user', (value) => null) : null;
        return Post.fromJson(model);
      })),
      replys: List<Reply>.from((json['replys'] ?? []).map((model) {
        model.containsKey('user') ? model.update('user', (value) => null) : null;
        return Reply.fromJson(model);
      })),
      enneagramTests: List<EnneagramTest>.from((json['enneagramTests'] ?? []).map((model) {
        return EnneagramTest.fromJson(model);
      })),
    );
  }

  @override
  String toString() {
    return 'User{userId: $userId, userKey: $userKey, password: $password, email: $email, phoneNumber: $phoneNumber, nickname: $nickname, birthDay: $birthDay, myEnneagramType: $myEnneagramType, gender: $gender, posts: $posts, replys: $replys, enneagramTests: $enneagramTests}';
  }
}