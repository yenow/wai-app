import 'package:wai/models/user/user.dart';

class Post {
  int? postId;
  User? user;
  String? title;
  String? content;
  String? simpleContent;
  bool? isDelete;
  String? nickname;
  int? enneagramType;
  int? clickCount;

  Post({
    this.postId,
    this.title,
    this.content,
    this.simpleContent,
    this.isDelete,
    this.user,
    this.nickname,
    this.enneagramType
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      user : json['user'] != null ? User.fromJson(json['user']) : null,
      title: json['title'],
      content: json['content'],
      simpleContent: json['simpleContent'],
      isDelete: json['isDelete'],
      enneagramType: json['enneagramType'],
    );
  }
}

List<Post> dummyPosts = [
  Post(postId: 1, title: '제목입니다.', content: '내용입니다.', simpleContent: '내용입니다.', isDelete: false, nickname : '띠용', enneagramType : 1),
  Post(postId: 2, title: '제목입니다.', content: '내용2입니다.',simpleContent: '내용2입니다.', isDelete: false, nickname : '띠용1', enneagramType : 2 ),
  Post(postId: 3, title: '제목입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDelete: false, nickname : '띠용2', enneagramType : 3 ),
];

