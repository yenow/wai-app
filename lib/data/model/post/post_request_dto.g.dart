// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRequestDto _$PostRequestDtoFromJson(Map<String, dynamic> json) =>
    PostRequestDto(
      postId: json['postId'] as int?,
      userId: json['userId'] as int?,
      maxPostsSize: json['maxPostsSize'] as int?,
      startPostId: json['startPostId'] as int?,
      endPostId: json['endPostId'] as int?,
      myEnneagramType: json['myEnneagramType'] as int?,
      postSearchType:
          $enumDecodeNullable(_$PostSearchTypeEnumMap, json['postSearchType']),
      searchText: json['searchText'] as String?,
      canUpdateCount: json['canUpdateCount'] as bool?,
    );

Map<String, dynamic> _$PostRequestDtoToJson(PostRequestDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.userId,
      'maxPostsSize': instance.maxPostsSize,
      'startPostId': instance.startPostId,
      'endPostId': instance.endPostId,
      'myEnneagramType': instance.myEnneagramType,
      'postSearchType': _$PostSearchTypeEnumMap[instance.postSearchType],
      'searchText': instance.searchText,
      'canUpdateCount': instance.canUpdateCount,
    };

const _$PostSearchTypeEnumMap = {
  PostSearchType.all: 'all',
  PostSearchType.content: 'content',
  PostSearchType.title: 'title',
  PostSearchType.author: 'author',
  PostSearchType.popular: 'popular',
  PostSearchType.enneagramType: 'enneagramType',
  PostSearchType.myPosts: 'myPosts',
  PostSearchType.myReplyPosts: 'myReplyPosts',
  PostSearchType.tag: 'tag',
};
