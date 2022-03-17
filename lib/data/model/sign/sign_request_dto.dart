import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'sign_request_dto.g.dart';

@JsonSerializable()
class SignRequestDto {
  String token;
  String userKey;
  String email;
  String password;
  String nickname;

  SignRequestDto({
    this.token = "",
    this.userKey = "",
    this.email = "",
    this.password = "",
    this.nickname = ""
  });

  factory SignRequestDto.fromJson(Map<String, dynamic> json) => _$SignRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignRequestDtoToJson(this);

  /*Map<String, dynamic> toJson() {
    return {
      "token" : token,
      "userKey" : userKey,
      "email" : email,
      "password" : password,
      "nickname" : nickname,
    };
  }*/


}