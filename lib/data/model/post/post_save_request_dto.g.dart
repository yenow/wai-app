// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_save_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostSaveRequestDto _$PostSaveRequestDtoFromJson(Map<String, dynamic> json) =>
    PostSaveRequestDto(
      userId: json['userId'] as int?,
      userKey: json['userKey'] as String?,
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      tag: json['tag'] as String? ?? "",
      author: json['author'] as String?,
      authorEnneagramType: json['authorEnneagramType'] as int?,
    );

Map<String, dynamic> _$PostSaveRequestDtoToJson(PostSaveRequestDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userKey': instance.userKey,
      'title': instance.title,
      'content': instance.content,
      'tag': instance.tag,
      'author': instance.author,
      'authorEnneagramType': instance.authorEnneagramType,
    };
