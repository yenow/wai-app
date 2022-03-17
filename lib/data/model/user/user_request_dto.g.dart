// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestDto _$UserRequestDtoFromJson(Map<String, dynamic> json) =>
    UserRequestDto(
      userId: json['userId'] as int?,
      userKey: json['userKey'] as String,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$UserRequestDtoToJson(UserRequestDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userKey': instance.userKey,
      'nickname': instance.nickname,
    };
