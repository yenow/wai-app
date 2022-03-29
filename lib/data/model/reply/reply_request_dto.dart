import 'package:json_annotation/json_annotation.dart';
import 'reply.dart';

part 'reply_request_dto.g.dart';

@JsonSerializable()
class ReplyRequestDto {
  String? replyId;
  String? author;
  int? authorEnneagramType;
  String replyContent;

  String? parentReplyId;
  String? parentReplyUserId;
  String? parentAuthor;

  String? userId;
  String? postId;

  ReplyRequestDto({
    this.replyId,
    this.author,
    this.authorEnneagramType,
    this.replyContent = "",

    this.parentReplyId,
    this.parentReplyUserId,
    this.parentAuthor = "",

    this.userId,
    this.postId,
  });

  factory ReplyRequestDto.fromJson(Map<String, dynamic> json) => _$ReplyRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyRequestDtoToJson(this);

  @override
  String toString() {
    return 'ReplyRequestDto{replyId: $replyId, author: $author, authorEnneagramType: $authorEnneagramType, replyContent: $replyContent, parentReplyId: $parentReplyId, parentReplyUserId: $parentReplyUserId, parentAuthor: $parentAuthor, userId: $userId, postId: $postId}';
  }
}