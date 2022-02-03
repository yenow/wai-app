import 'package:wai/models/reply/reply.dart';
import 'package:wai/models/user/user.dart';

class Post {
  int? postId;
  User? user;
  List<Reply>? replys;
  String? title;
  String? author;
  String? content;
  String? simpleContent;
  bool? isDelete;
  String? nickname;
  int? enneagramType;
  int? clickCount;
  DateTime? insertDate;

  Post({
    this.postId,
    this.user,
    this.replys,
    this.title,
    this.author,
    this.content,
    this.simpleContent,
    this.isDelete,
    this.nickname,
    this.enneagramType,
    this.clickCount,
    this.insertDate
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    User? user = json['user'] != null ? User.fromJson(json['user']) : null;

    List<Reply> replys;
    if (json['replys'] != null) {
      replys = List<Reply>.from(json['replys'].map((model) {
        return Reply.fromJson(model);
      }));
    } else {
      replys = [];
    }

    return Post(
      postId: json['postId'],
      user : user,
      replys : replys,
      title: json['title'],
      author: json['author'],
      content: json['content'],
      simpleContent: json['simpleContent'],
      isDelete: json['isDelete'],
      enneagramType: json['enneagramType'],
      clickCount: json['clickCount'] ?? 0,
      insertDate: json['insertDate'] != null ? DateTime.parse(json['insertDate']) : null,
    );
  }

  @override
  String toString() {
    return 'Post{postId: $postId, user: $user, replys: $replys, title: $title, author: $author, content: $content, simpleContent: $simpleContent, isDelete: $isDelete, nickname: $nickname, enneagramType: $enneagramType, clickCount: $clickCount, insertDate: $insertDate}';
  }
}

List<Post> dummyPosts = [
  Post(postId: 1, title: '제목입니다.', content: '내용입니다.', simpleContent: '내용입니다.', isDelete: false, nickname : '띠용', enneagramType : 1),
  Post(postId: 2, title: '제목입니다.', content: '내용2입니다.',simpleContent: '내용2입니다.', isDelete: false, nickname : '띠용1', enneagramType : 2 ),
  Post(postId: 3, title: '제목입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDelete: false, nickname : '띠용2', enneagramType : 3 ),
];

