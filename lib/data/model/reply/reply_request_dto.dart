import 'reply.dart';

class ReplyRequestDto {
  String? replyId;
  String? parentReplyId;
  String? userId;
  String? postId;
  String? author;
  String? parentAuthor;
  int? authorEnneagramType;
  String? replyContent;

  ReplyRequestDto({
    this.replyId,
    this.userId,
    this.postId,
    this.parentReplyId,
    this.author,
    this.parentAuthor = "",
    this.authorEnneagramType,
    this.replyContent = ""
  });

  Map<String, dynamic> toJson() {
    return {
      "replyId" : replyId,
      "userId" : userId,
      "postId" : postId,
      "parentReplyId" : parentReplyId,
      "author": author,
      "parentAuthor" : parentAuthor,
      "authorEnneagramType": authorEnneagramType,
      "replyContent" : replyContent,
    };
  }

  void setReplyRequestDto(Reply reply) {
    replyId = reply.replyId!.toString();
    userId = reply.user!.userId!.toString();
    postId = reply.post!.postId!.toString();
    parentReplyId = reply.parentReplyId != null ? reply.parentReplyId!.toString() : null;
    author = reply.author;
    parentAuthor = reply.parentAuthor;
    authorEnneagramType = reply.authorEnneagramType;
  }

  @override
  String toString() {
    return 'ReplyRequestDto{replyId: $replyId, userId: $userId, postId: $postId, parentReplyId: $parentReplyId, parentAuthor: $parentAuthor, author: $author, authorEnneagramType: $authorEnneagramType, replyContent: $replyContent}';
  }
}