// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanUserRequest _$BanUserRequestFromJson(Map<String, dynamic> json) =>
    BanUserRequest(
      userId: json['userId'] as int?,
      banUserId: json['banUserId'] as int?,
    );

Map<String, dynamic> _$BanUserRequestToJson(BanUserRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'banUserId': instance.banUserId,
    };
