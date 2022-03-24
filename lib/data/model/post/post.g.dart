// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      postId: json['postId'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      author: json['author'] as String?,
      authorEnneagramType: json['authorEnneagramType'] as int?,
      clickCount: json['clickCount'] as int?,
      isDeleted: json['isDeleted'] as bool?,
      isReported: json['isReported'] as bool?,
      insertDate: json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      userId: json['userId'] as int?,
      replyCount: json['replyCount'] as int?,
      likeyCount: json['likeyCount'] as int?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'content': instance.content,
      'author': instance.author,
      'authorEnneagramType': instance.authorEnneagramType,
      'clickCount': instance.clickCount,
      'isDeleted': instance.isDeleted,
      'isReported': instance.isReported,
      'insertDate': instance.insertDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'userId': instance.userId,
      'replyCount': instance.replyCount,
      'likeyCount': instance.likeyCount,
    };
