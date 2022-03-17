import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_request_dto.g.dart';

@JsonSerializable()
class UserRequestDto {
  int? userId;
  String userKey;
  String? nickname;

  UserRequestDto({this.userId, required this.userKey, this.nickname});

  factory UserRequestDto.fromJson(Map<String, dynamic> json) => _$UserRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserRequestDtoToJson(this);

 /* Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "userKey" : userKey,
      "nickname" : nickname,
    };
  }*/

  @override
  String toString() {
    return 'UserRequestDto{userId: $userId, userKey: $userKey, nickname: $nickname}';
  }
}