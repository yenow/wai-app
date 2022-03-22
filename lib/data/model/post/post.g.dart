// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      postId: json['postId'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      title: json['title'] as String?,
      author: json['author'] as String?,
      authorEnneagramType: json['authorEnneagramType'] as int?,
      content: json['content'] as String?,
      simpleContent: json['simpleContent'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      nickname: json['nickname'] as String?,
      enneagramType: json['enneagramType'] as int?,
      clickCount: json['clickCount'] as int?,
      likeyCount: json['likeyCount'] as int?,
      likeys: (json['likeys'] as List<dynamic>?)?.map((e) => e as int).toList(),
      insertDate: json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'user': instance.user,
      'title': instance.title,
      'author': instance.author,
      'authorEnneagramType': instance.authorEnneagramType,
      'content': instance.content,
      'simpleContent': instance.simpleContent,
      'isDeleted': instance.isDeleted,
      'nickname': instance.nickname,
      'enneagramType': instance.enneagramType,
      'clickCount': instance.clickCount,
      'likeyCount': instance.likeyCount,
      'likeys': instance.likeys,
      'insertDate': instance.insertDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
    };
