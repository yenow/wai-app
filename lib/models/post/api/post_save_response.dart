class PostSaveResponseDto {
  bool? isSuccess;
  String? errorMessage;
  num? postId;


  PostSaveResponseDto({this.isSuccess, this.errorMessage, this.postId});

  factory PostSaveResponseDto.fromJson(Map<String,dynamic> json) {
    return PostSaveResponseDto(
      isSuccess: json['isSuccess'],
      errorMessage: json['errorMessage'],
      postId: json['postId'],
    );
  }
}