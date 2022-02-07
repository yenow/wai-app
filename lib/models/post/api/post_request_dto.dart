class PostRequestDto {
  int? postId;
  int? postsCount;
  int? startPostId;
  int? endPostId;
  PostSearchType? postSearchType;
  String? searchText;

  PostRequestDto({
    this.postId, this.postsCount, this.startPostId, this.endPostId, this.postSearchType, this.searchText
  });

  Map<String, dynamic> toJson() => {
    'postId': postId,
    'postsCount': postsCount,
    'startPostId': startPostId,
    'endPostId': endPostId,
    'postSearchType' : postSearchType != null ? postSearchType!.name : null,
    'searchText': searchText,
  };

  @override
  String toString() {
    return 'PostRequestDto{postId: $postId, postsCount: $postsCount, startPostId: $startPostId, endPostId: $endPostId, postSearchType: $postSearchType}';
  }
}

enum PostSearchType {
  all, content, title, author, popular
}

extension ParseToString on PostSearchType {
  String get name {
    return toString().split('.').last;
  }
}