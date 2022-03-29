// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyRequestDto _$ReplyRequestDtoFromJson(Map<String, dynamic> json) =>
    ReplyRequestDto(
      replyId: json['replyId'] as String?,
      author: json['author'] as String?,
      authorEnneagramType: json['authorEnneagramType'] as int?,
      replyContent: json['replyContent'] as String? ?? "",
      parentReplyId: json['parentReplyId'] as String?,
      parentReplyUserId: json['parentReplyUserId'] as String?,
      parentAuthor: json['parentAuthor'] as String? ?? "",
      userId: json['userId'] as String?,
      postId: json['postId'] as String?,
    );

Map<String, dynamic> _$ReplyRequestDtoToJson(ReplyRequestDto instance) =>
    <String, dynamic>{
      'replyId': instance.replyId,
      'author': instance.author,
      'authorEnneagramType': instance.authorEnneagramType,
      'replyContent': instance.replyContent,
      'parentReplyId': instance.parentReplyId,
      'parentReplyUserId': instance.parentReplyUserId,
      'parentAuthor': instance.parentAuthor,
      'userId': instance.userId,
      'postId': instance.postId,
    };
