import 'package:enum_to_string/enum_to_string.dart';
import 'package:wai/data/model/user.dart';

enum WiseSayingCategory {
  love, life, study, success, friend, bye, time, effort, challenge, hope, happy
}

class WiseSaying {
  int? id;
  User? user;
  String? wiseSayingCategory;
  String? wiseSaying;
  String? author;

  WiseSaying({
    this.id,
    this.user,
    this.wiseSayingCategory,
    this.wiseSaying,
    this.author
  });

  factory WiseSaying.fromJson(Map<String, dynamic> json) {
    return WiseSaying(
      id: json["id"],
      wiseSayingCategory: json["wiseSayingCategory"],   //E numToString.fromString(WiseSayingCategory.values, json['wiseSayingCategory'] as String),
      wiseSaying: json["wiseSaying"],
      author: json["author"],
    );
  }

  @override
  String toString() {
    return 'WiseSaying{id: $id, user: $user, wiseSayingCategory: $wiseSayingCategory, wiseSaying: $wiseSaying, author: $author}';
  }
}