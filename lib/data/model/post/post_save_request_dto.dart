import 'dart:convert';

class PostSaveRequestDto {
  String? postId;
  String? userId;
  String? userKey;
  String title;
  String content;
  String tag;
  String? author;
  int? authorEnneagramType;

  PostSaveRequestDto({
    this.postId = "",
    this.userId = "",
    this.userKey = "",
    this.title = "",
    this.content = "",
    this.tag = "",
    this.author = "",
    this.authorEnneagramType
  });

  Map<String, dynamic> toJson () {
    return {
      "postId" : postId,
      "userId" : userId,
      "userKey" : userKey,
      "title" : title,
      "content" : content,
      "tag" : tag,
      "author" : author,
      "authorEnneagramType" : authorEnneagramType,
    };
  }

  bool isValidTitle () {
    return title.trim() == "" ? false : true;
  }

  bool isValidContent () {
    return content.trim() == "" ? false : true;
  }
}