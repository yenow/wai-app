import 'package:wai/models/post/post.dart';
import 'package:wai/models/user/user.dart';

class Reply {
  int? replyId;
  int? parentReplyId;
  User? user;
  Post? post;
  String? replyContent;
  bool? isReported;
  DateTime? insertDate;
  DateTime? nowServerTime;

  Reply({
    this.replyId,
    this.parentReplyId,
    this.user,
    this.post,
    this.replyContent,
    this.isReported,
    this.insertDate,
    this.nowServerTime
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
      isReported: json['isReported'],
      insertDate: DateTime.parse(json['insertDate']),
      nowServerTime: DateTime.parse(json['nowServerTime']),
    );
  }

  @override
  String toString() {
    return 'Reply{replyId: $replyId, parentReplyId: $parentReplyId, user: $user, post: $post, replyContent: $replyContent, insertDate: $insertDate}';
  }
}

