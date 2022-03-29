// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeRequestDto _$NoticeRequestDtoFromJson(Map<String, dynamic> json) =>
    NoticeRequestDto(
      noticeId: json['noticeId'] as int?,
      recipientUserId: json['recipientUserId'] as int?,
      maxNoticeSize: json['maxNoticeSize'] as int?,
      lastNoticeId: json['lastNoticeId'] as int?,
    );

Map<String, dynamic> _$NoticeRequestDtoToJson(NoticeRequestDto instance) =>
    <String, dynamic>{
      'noticeId': instance.noticeId,
      'recipientUserId': instance.recipientUserId,
      'maxNoticeSize': instance.maxNoticeSize,
      'lastNoticeId': instance.lastNoticeId,
    };
