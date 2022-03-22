import 'package:json_annotation/json_annotation.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/data/model/user/user.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  int? postId;
  User? user;
  // List<Reply>? replys;
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
    // this.replys,
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

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return 'Post{postId: $postId, user: $user, title: $title, author: $author, authorEnneagramType: $authorEnneagramType, content: $content, simpleContent: $simpleContent, isDeleted: $isDeleted, nickname: $nickname, enneagramType: $enneagramType, clickCount: $clickCount, likeyCount: $likeyCount, likeys: $likeys, insertDate: $insertDate, updateDate: $updateDate}';
  }

/*  factory Post.fromJson(Map<String, dynamic> json) {

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
  }*/


}

List<Post> dummyPosts = [
  Post(postId: 1, title: '제목1입니다.', content: '내용입니다.', simpleContent: '내용입니다.', isDeleted: false, nickname : '띠용', enneagramType : 1),
  Post(postId: 2, title: '제목2입니다.', content: '내용2입니다.',simpleContent: '내용2입니다.', isDeleted: false, nickname : '띠용1', enneagramType : 2 ),
  Post(postId: 3, title: '제목3입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDeleted: false, nickname : '띠용2', enneagramType : 3 ),
  Post(postId: 4, title: '제목4입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDeleted: false, nickname : '띠용4', enneagramType : 4 ),
  Post(postId: 5, title: '제목5입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDeleted: false, nickname : '띠용5', enneagramType : 3 ),
  Post(postId: 6, title: '제목6입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDeleted: false, nickname : '띠용6', enneagramType : 3 ),
  Post(postId: 7, title: '제목7입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDeleted: false, nickname : '띠용7', enneagramType : 3 ),
  Post(postId: 8, title: '제목8입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDeleted: false, nickname : '띠용8', enneagramType : 3 ),
  Post(postId: 9, title: '제목9입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDeleted: false, nickname : '띠용9', enneagramType : 3 ),
];

