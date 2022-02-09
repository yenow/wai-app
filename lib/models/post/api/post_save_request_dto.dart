class PostSaveRequestDto {
  String userId = "";
  String userKey = "";
  String title = "";
  String content = "";
  String author = "";

  Map<String, dynamic> toJson () {
    return {
      "userId" : userId,
      "userKey" : userKey,
      "title" : title,
      "content" : content,
      "author" : author,
    };
  }

  bool isValidTitle () {
    return title.trim() == "" ? false : true;
  }

  bool isValidContent () {
    return content.trim() == "" ? false : true;
  }
}