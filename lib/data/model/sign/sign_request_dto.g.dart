// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignRequestDto _$SignRequestDtoFromJson(Map<String, dynamic> json) =>
    SignRequestDto(
      token: json['token'] as String? ?? "",
      userKey: json['userKey'] as String? ?? "",
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      nickname: json['nickname'] as String? ?? "",
    );

Map<String, dynamic> _$SignRequestDtoToJson(SignRequestDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userKey': instance.userKey,
      'email': instance.email,
      'password': instance.password,
      'nickname': instance.nickname,
    };
