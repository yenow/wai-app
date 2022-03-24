import 'package:json_annotation/json_annotation.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/user/user.dart';

part 'reply.g.dart';

@JsonSerializable()
class Reply {
  int? replyId;
  int? parentReplyId;
  String? author;
  String? parentAuthor;
  int? authorEnneagramType;
  String? replyContent;
  bool? isReported;
  bool? isDeleted;
  DateTime? insertDate;
  DateTime? updateDate;

  int? userId;
  int? postId;

  Reply({
    this.replyId,
    this.parentReplyId,
    this.author,
    this.parentAuthor,
    this.authorEnneagramType,
    this.replyContent,
    this.isReported,
    this.isDeleted,
    this.insertDate,
    this.updateDate,
    this.userId,
    this.postId,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyToJson(this);

  @override
  String toString() {
    return 'Reply{replyId: $replyId, parentReplyId: $parentReplyId, author: $author, parentAuthor: $parentAuthor, authorEnneagramType: $authorEnneagramType, replyContent: $replyContent, isReported: $isReported, isDeleted: $isDeleted, insertDate: $insertDate, updateDate: $updateDate, userId: $userId, postId: $postId}';
  }
}

