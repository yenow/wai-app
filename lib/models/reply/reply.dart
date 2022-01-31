import 'package:wai/models/post/post.dart';
import 'package:wai/models/user/user.dart';

class Reply {
  int? replyId;
  int? parentReplyId;
  User? user;
  Post? post;
  String? replyContent;

}

