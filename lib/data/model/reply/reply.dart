import 'package:json_annotation/json_annotation.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/user/user.dart';

part 'reply.g.dart';

@JsonSerializable()
class Reply {
  int? replyId;
  String? author;
  int? authorEnneagramType;
  String? replyContent;

  int? parentReplyId;
  int? parentReplyUserId;
  String? parentAuthor;

  bool? isReported;
  bool? isDeleted;
  DateTime? insertDate;
  DateTime? updateDate;

  int? userId;
  int? postId;

  Reply({
    this.replyId,
    this.author,
    this.authorEnneagramType,
    this.replyContent,

    this.parentReplyId,
    this.parentReplyUserId,
    this.parentAuthor,

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
    return 'Reply{replyId: $replyId, author: $author, authorEnneagramType: $authorEnneagramType, replyContent: $replyContent, parentReplyId: $parentReplyId, parentReplyUserId: $parentReplyUserId, parentAuthor: $parentAuthor, isReported: $isReported, isDeleted: $isDeleted, insertDate: $insertDate, updateDate: $updateDate, userId: $userId, postId: $postId}';
  }
}

