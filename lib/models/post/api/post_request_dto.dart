class PostRequestDto {
  int? postId;
  int? postsCount;
  int? startPostId;
  int? endPostId;

  Map<String, dynamic> toJson() => {
    'postId': postId,
    'postsCount': postsCount,
    'startPostId': startPostId,
    'endPostId': endPostId,
  };

  @override
  String toString() {
    return 'PostRequestDto{postId: $postId, postsCount: $postsCount, startPostId: $startPostId, endPostId: $endPostId}';
  }
}