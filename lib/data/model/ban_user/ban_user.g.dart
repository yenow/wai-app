// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanUser _$BanUserFromJson(Map<String, dynamic> json) => BanUser(
      userId: json['userId'] as int?,
      banUserId: json['banUserId'] as int?,
      banNickname: json['banNickname'] as String?,
    );

Map<String, dynamic> _$BanUserToJson(BanUser instance) => <String, dynamic>{
      'userId': instance.userId,
      'banUserId': instance.banUserId,
      'banNickname': instance.banNickname,
    };
