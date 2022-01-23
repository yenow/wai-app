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
}