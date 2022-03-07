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
  String? userKey;
  String? password;
  String? nickname;
  String? email;
  int? myEnneagramType;

  List<Post> posts;
  List<Reply> replys;
  List<EnneagramTest> enneagramTests;

  User({
    this.userId,
    this.userKey,
    this.password,
    this.nickname,
    this.email,
    this.myEnneagramType,
    this.posts = const [],
    this.replys = const [],
    this.enneagramTests = const [],
  });

  void setUserBySign(Sign sign) {
    userId = sign.userId;
    userKey = sign.userKey;
    nickname = sign.nickname;
  }

  UserRequestDto toUserRequestDto() {
    return UserRequestDto(userKey: userKey!);
  }

  void updateEnneagramTest(EnneagramTest response) {
    List<EnneagramTest> tempList = enneagramTests.sublist(0);
    tempList.insert(0, response);
    enneagramTests = tempList;
    myEnneagramType = response.myEnneagramType;
  }

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      userId: json['userId'],
      userKey: json['userKey'],
      password: json['password'],
      nickname: json['nickname'],
      email: json['email'],
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
    return 'User{userId: $userId, userKey: $userKey, password: $password, nickname: $nickname, email: $email, myEnneagramType: $myEnneagramType, posts: $posts, replys: $replys, enneagramTests: $enneagramTests}';
  }
}