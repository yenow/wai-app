// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reply _$ReplyFromJson(Map<String, dynamic> json) => Reply(
      replyId: json['replyId'] as int?,
      parentReplyId: json['parentReplyId'] as int?,
      author: json['author'] as String?,
      parentAuthor: json['parentAuthor'] as String?,
      authorEnneagramType: json['authorEnneagramType'] as int?,
      replyContent: json['replyContent'] as String?,
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
      'parentReplyId': instance.parentReplyId,
      'author': instance.author,
      'parentAuthor': instance.parentAuthor,
      'authorEnneagramType': instance.authorEnneagramType,
      'replyContent': instance.replyContent,
      'isReported': instance.isReported,
      'isDeleted': instance.isDeleted,
      'insertDate': instance.insertDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'userId': instance.userId,
      'postId': instance.postId,
    };
