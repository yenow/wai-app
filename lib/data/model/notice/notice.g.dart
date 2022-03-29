// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notice _$NoticeFromJson(Map<String, dynamic> json) => Notice(
      json['noticeId'] as int?,
      json['giverNickname'] as String?,
      json['targetPostId'] as int?,
      json['targetReplyId'] as int?,
      $enumDecodeNullable(_$NoticeTypeEnumMap, json['noticeType']),
      json['content'] as String?,
      json['isRead'] as bool?,
      json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String),
    );

Map<String, dynamic> _$NoticeToJson(Notice instance) => <String, dynamic>{
      'noticeId': instance.noticeId,
      'giverNickname': instance.giverNickname,
      'targetPostId': instance.targetPostId,
      'targetReplyId': instance.targetReplyId,
      'noticeType': _$NoticeTypeEnumMap[instance.noticeType],
      'content': instance.content,
      'isRead': instance.isRead,
      'insertDate': instance.insertDate?.toIso8601String(),
    };

const _$NoticeTypeEnumMap = {
  NoticeType.reply: 'reply',
  NoticeType.parentReply: 'parentReply',
};
