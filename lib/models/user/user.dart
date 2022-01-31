import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/reply/reply.dart';

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

  List<Post>? posts;
  List<Reply>? replys;
  List<Enneagram>? enneagrams;

  User({
    this.userId,
    this.userKey,
    this.password,
    this.email,
    this.phoneNumber,
    this.nickname,
    this.birthDay,
    this.gender,
    this.posts,
    this.enneagrams,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    //Iterable l = json.decode(response.body);
    //List<Post> posts = List<Post>.from(l.map(  (model) => Post.fromJson(model) ));
    List<Post> posts;
    if (json['posts'] != null) {
      posts = List<Post>.from(json['posts'].map((model) {
        model.update('user', (value) => null);
        return Post.fromJson(model);
      }));
    } else {
      posts = [];
    }

    return User(
      userId: json['userId'],
      userKey: json['userKey'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      birthDay: json['birthDay'],
      gender: json['gender'],
      posts : posts,
    );
  }

  @override
  String toString() {
    return 'User{userId: $userId, userKey: $userKey, password: $password, email: $email, phoneNumber: $phoneNumber, nickname: $nickname, birthDay: $birthDay, gender: $gender, posts: $posts, replys: $replys, enneagrams: $enneagrams}';
  }
}