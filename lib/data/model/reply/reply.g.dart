// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reply _$ReplyFromJson(Map<String, dynamic> json) => Reply(
      replyId: json['replyId'] as int?,
      author: json['author'] as String?,
      authorEnneagramType: json['authorEnneagramType'] as int?,
      replyContent: json['replyContent'] as String?,
      parentReplyId: json['parentReplyId'] as int?,
      parentReplyUserId: json['parentReplyUserId'] as int?,
      parentAuthor: json['parentAuthor'] as String?,
      isReported: json['isReported'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      insertDate: json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      userId: json['userId'] as int?,
      postId: json['postId'] as int?,
    );

Map<String, dynamic> _$ReplyToJson(Reply instance) => <String, dynamic>{
      'replyId': instance.replyId,
      'author': instance.author,
      'authorEnneagramType': instance.authorEnneagramType,
      'replyContent': instance.replyContent,
      'parentReplyId': instance.parentReplyId,
      'parentReplyUserId': instance.parentReplyUserId,
      'parentAuthor': instance.parentAuthor,
      'isReported': instance.isReported,
      'isDeleted': instance.isDeleted,
      'insertDate': instance.insertDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'userId': instance.userId,
      'postId': instance.postId,
    };
