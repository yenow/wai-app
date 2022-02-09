class PostRequestDto {
  int? postId;
  int? postsCount;
  int? startPostId;
  int? endPostId;
  int? myEnneagramType;
  PostSearchType? postSearchType;
  String? searchText;
  bool? canUpdateCount;

  PostRequestDto({
    this.postId, this.postsCount, this.startPostId, this.endPostId, this.myEnneagramType, this.postSearchType, this.searchText, this.canUpdateCount
  });

  Map<String, dynamic> toJson() => {
    'postId': postId,
    'postsCount': postsCount,
    'startPostId': startPostId,
    'endPostId': endPostId,
    'myEnneagramType': myEnneagramType,
    'postSearchType' : postSearchType != null ? postSearchType!.name : null,
    'searchText': searchText,
    'canUpdateCount': canUpdateCount,
  };

  @override
  String toString() {
    return 'PostRequestDto{postId: $postId, postsCount: $postsCount, startPostId: $startPostId, endPostId: $endPostId, myEnneagramType: $myEnneagramType, postSearchType: $postSearchType, searchText: $searchText}';
  }
}

enum PostSearchType {
  all, content, title, author, popular, enneagramType
}

extension ParseToString on PostSearchType {
  String get name {
    return toString().split('.').last;
  }
}