class ReplyRequestDto {
  String? replyId;
  String? userId;
  String? postId;
  String? parentReplyId;
  String? parentReplyNickname;
  String? replyContent;

  ReplyRequestDto({
    this.replyId,
    this.userId,
    this.postId,
    this.parentReplyId,
    this.parentReplyNickname = "",
    this.replyContent = ""
  });

  Map<String, dynamic> toJson() {
    return {
      "replyId" : replyId,
      "userId" : userId,
      "postId" : postId,
      "parentReplyId" : parentReplyId,
      "parentReplyNickname" : parentReplyNickname,
      "replyContent" : replyContent,
    };
  }

  @override
  String toString() {
    return 'ReplyRequestDto{replyId: $replyId, userId: $userId, postId: $postId, parentReplyId: $parentReplyId, parentReplyNickname: $parentReplyNickname, replyContent: $replyContent}';
  }
}