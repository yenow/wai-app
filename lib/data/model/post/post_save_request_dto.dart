import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'post_save_request_dto.g.dart';

@JsonSerializable()
class PostSaveRequestDto {
  int? userId;
  String? userKey;
  String title;
  String content;
  String tag;
  String? author;
  int? authorEnneagramType;

  PostSaveRequestDto({
    this.userId,
    this.userKey,
    this.title = "",
    this.content = "",
    this.tag = "",
    this.author,
    this.authorEnneagramType
  });

  factory PostSaveRequestDto.fromJson(Map<String, dynamic> json) => _$PostSaveRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PostSaveRequestDtoToJson(this);

  // Map<String, dynamic> toJson () {
  //   return {
  //     "postId" : postId,
  //     "userId" : userId,
  //     "userKey" : userKey,
  //     "title" : title,
  //     "content" : content,
  //     "tag" : tag,
  //     "author" : author,
  //     "authorEnneagramType" : authorEnneagramType,
  //   };
  // }

  bool isValidTitle () {
    return title.trim() == "" ? false : true;
  }

  bool isValidContent () {
    return content.trim() == "" ? false : true;
  }
}