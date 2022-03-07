import 'package:wai/models/reply/reply.dart';
import 'package:wai/data/model/user.dart';

class Post {
  int? postId;
  User? user;
  List<Reply>? replys;
  String? title;
  String? author;
  int? authorEnneagramType;
  String? content;
  String? simpleContent;
  bool? isDeleted;
  String? nickname;
  int? enneagramType;
  int? clickCount;
  int? likeyCount;
  List<int>? likeys;
  DateTime? insertDate;
  DateTime? updateDate;

  Post({
    this.postId,
    this.user,
    this.replys,
    this.title,
    this.author,
    this.authorEnneagramType,
    this.content,
    this.simpleContent,
    this.isDeleted,
    this.nickname,
    this.enneagramType,
    this.clickCount,
    this.likeyCount,
    this.likeys,
    this.insertDate,
    this.updateDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) {

    return Post(
      postId: json['postId'],
      user : User.fromJson((json['user'] ?? {})),
      replys : List<Reply>.from((json['replys'] ?? []).map((model) {
        return Reply.fromJson(model);})
      ),
      title: json['title'],
      author: json['author'],
      authorEnneagramType: json['authorEnneagramType'],
      content: json['content'],
      simpleContent: json['simpleContent'],
      isDeleted: json['isDeleted'],
      enneagramType: json['enneagramType'],
      clickCount: json['clickCount'] ?? 0,
      likeyCount: json['likeyCount'],
      likeys: List<int>.from((json['likeys'] ?? [])),
      insertDate: DateTime.parse((json['insertDate'] ?? DateTime.now().toString())),
      updateDate: DateTime.parse((json['updateDate'] ?? DateTime.now().toString())),
    );
  }

  @override
  String toString() {
    return 'Post{postId: $postId, user: $user, replys: $replys, title: $title, author: $author, content: $content, simpleContent: $simpleContent, isDeleted: $isDeleted, nickname: $nickname, enneagramType: $enneagramType, clickCount: $clickCount, insertDate: $insertDate}';
  }
}

List<Post> dummyPosts = [
  Post(postId: 1, title: '제목입니다.', content: '내용입니다.', simpleContent: '내용입니다.', isDeleted: false, nickname : '띠용', enneagramType : 1),
  Post(postId: 2, title: '제목입니다.', content: '내용2입니다.',simpleContent: '내용2입니다.', isDeleted: false, nickname : '띠용1', enneagramType : 2 ),
  Post(postId: 3, title: '제목입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDeleted: false, nickname : '띠용2', enneagramType : 3 ),
];

