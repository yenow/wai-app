import 'package:json_annotation/json_annotation.dart';

part 'post_request_dto.g.dart';

enum PostSearchType {
  all, content, title, author, popular, enneagramType, myPosts, myReplyPosts, tag
}

extension ParseToString on PostSearchType {
  String get name {
    return toString().split('.').last;
  }
}

@JsonSerializable()
class PostRequestDto {
  int? postId;
  int? userId;
  int? maxPostsSize;
  int? startPostId;
  int? endPostId;
  int? myEnneagramType;
  PostSearchType? postSearchType;
  String? searchText;
  bool? canUpdateCount;

  PostRequestDto({
    this.postId, this.userId, this.maxPostsSize, this.startPostId, this.endPostId, this.myEnneagramType, this.postSearchType, this.searchText, this.canUpdateCount
  });

  factory PostRequestDto.fromJson(Map<String, dynamic> json) => _$PostRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PostRequestDtoToJson(this);


  // Map<String, dynamic> toJson() => {
  //   'postId': postId,
  //   'userId': userId,
  //   'postsCount': postsCount,
  //   'startPostId': startPostId,
  //   'endPostId': endPostId,
  //   'myEnneagramType': myEnneagramType,
  //   'postSearchType' : postSearchType != null ? postSearchType!.name : null,
  //   'searchText': searchText,
  //   'canUpdateCount': canUpdateCount,
  // };

  @override
  String toString() {
    return 'PostRequestDto{postId: $postId, userId: $userId, postsCount: $maxPostsSize, startPostId: $startPostId, endPostId: $endPostId, myEnneagramType: $myEnneagramType, postSearchType: $postSearchType, searchText: $searchText, canUpdateCount: $canUpdateCount}';
  }
}
