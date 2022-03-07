import 'package:wai/models/post/post.dart';
import 'package:wai/data/model/user.dart';

class Reply {
  int? replyId;
  int? parentReplyId;
  User? user;
  Post? post;
  String? author;
  String? parentAuthor;
  int? authorEnneagramType;
  String? replyContent;
  bool? isReported;
  bool? isDeleted;
  DateTime? insertDate;
  DateTime? updateDate;

  Reply({
    this.replyId,
    this.parentReplyId,
    this.user,
    this.post,
    this.author,
    this.parentAuthor,
    this.authorEnneagramType,
    this.replyContent,
    this.isReported,
    this.isDeleted,
    this.insertDate,
    this.updateDate,
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    User? user = json['user'] != null ? User.fromJson(json['user']) : null;
    Post? post = json['post'] != null ? Post.fromJson(json['post']) : null;

    return Reply(
      replyId: json['replyId'],
      parentReplyId: json['parentReplyId'],
      user: user,
      post: post,
      author: json['author'],
      parentAuthor: json['parentAuthor'] ?? "",
      authorEnneagramType: json['authorEnneagramType'],
      replyContent: json['replyContent'],
      isReported: json['isReported'],
      isDeleted: json['isDeleted'],
      insertDate: DateTime.parse(json['insertDate'] ?? DateTime.now().toString()),
      updateDate: DateTime.parse(json['updateDate'] ?? DateTime.now().toString()),
    );
  }

  @override
  String toString() {
    return 'Reply{replyId: $replyId, parentReplyId: $parentReplyId, user: $user, post: $post, replyContent: $replyContent, insertDate: $insertDate}';
  }
}

