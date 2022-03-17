// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as int?,
      userKey: json['userKey'] as String? ?? "",
      password: json['password'] as String?,
      nickname: json['nickname'] as String?,
      email: json['email'] as String?,
      myEnneagramType: json['myEnneagramType'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'userKey': instance.userKey,
      'password': instance.password,
      'nickname': instance.nickname,
      'email': instance.email,
      'myEnneagramType': instance.myEnneagramType,
    };
