import 'package:wai/models/post/post.dart';
import 'package:wai/models/user/user.dart';

class Reply {
  int? replyId;
  int? parentReplyId;
  User? user;
  Post? post;
  String? replyContent;
  DateTime? insertDate;

  Reply({
    this.replyId,
    this.parentReplyId,
    this.user,
    this.post,
    this.replyContent,
    this.insertDate
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    User? user = json['user'] != null ? User.fromJson(json['user']) : null;
    Post? post = json['post'] != null ? Post.fromJson(json['post']) : null;

    return Reply(
      replyId: json['replyId'],
      parentReplyId: json['parentReplyId'],
      user: user,
      post: post,
      replyContent: json['replyContent'],
      insertDate: DateTime.parse(json['insertDate']),
    );
  }

  @override
  String toString() {
    return 'Reply{replyId: $replyId, parentReplyId: $parentReplyId, user: $user, post: $post, replyContent: $replyContent, insertDate: $insertDate}';
  }
}

