class PostRequestDto {
  int? postsCount;
  int? startPostId;
  int? endPostId;

  Map<String, dynamic> toJson() => {
    'postsCount': postsCount,
    'startPostId': startPostId,
    'endPostId': endPostId,
  };
}