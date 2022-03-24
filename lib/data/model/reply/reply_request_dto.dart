import 'package:json_annotation/json_annotation.dart';
import 'reply.dart';

part 'reply_request_dto.g.dart';

@JsonSerializable()
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

  factory ReplyRequestDto.fromJson(Map<String, dynamic> json) => _$ReplyRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyRequestDtoToJson(this);

  @override
  String toString() {
    return 'ReplyRequestDto{replyId: $replyId, userId: $userId, postId: $postId, parentReplyId: $parentReplyId, parentAuthor: $parentAuthor, author: $author, authorEnneagramType: $authorEnneagramType, replyContent: $replyContent}';
  }
}