class ReplyRequestDto {
  String? userId;
  String? postId;
  String? parentReplyId;
  String? parentReplyNickname;
  String? replyContent;

  ReplyRequestDto({
    this.userId,
    this.postId,
    this.parentReplyId,
    this.parentReplyNickname = "",
    this.replyContent = ""
  });

  Map<String, dynamic> toJson() {
    return {
      "userId" : userId,
      "postId" : postId,
      "parentReplyId" : parentReplyId,
      "parentReplyNickname" : parentReplyNickname,
      "replyContent" : replyContent,
    };
  }

  @override
  String toString() {
    return 'ReplyRequestDto{userId: $userId, postId: $postId, parentReplyId: $parentReplyId, parentReplyNickname: $parentReplyNickname, replyContent: $replyContent}';
  }
}