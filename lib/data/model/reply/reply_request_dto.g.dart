// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyRequestDto _$ReplyRequestDtoFromJson(Map<String, dynamic> json) =>
    ReplyRequestDto(
      replyId: json['replyId'] as String?,
      userId: json['userId'] as String?,
      postId: json['postId'] as String?,
      parentReplyId: json['parentReplyId'] as String?,
      author: json['author'] as String?,
      parentAuthor: json['parentAuthor'] as String? ?? "",
      authorEnneagramType: json['authorEnneagramType'] as int?,
      replyContent: json['replyContent'] as String? ?? "",
    );

Map<String, dynamic> _$ReplyRequestDtoToJson(ReplyRequestDto instance) =>
    <String, dynamic>{
      'replyId': instance.replyId,
      'parentReplyId': instance.parentReplyId,
      'userId': instance.userId,
      'postId': instance.postId,
      'author': instance.author,
      'parentAuthor': instance.parentAuthor,
      'authorEnneagramType': instance.authorEnneagramType,
      'replyContent': instance.replyContent,
    };
