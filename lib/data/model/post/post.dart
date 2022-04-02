import 'package:json_annotation/json_annotation.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/data/model/user/user.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  int? postId;
  String? title;
  String? content;
  String? author;
  int? authorEnneagramType;
  int? clickCount;
  String? backgroundImageName;
  bool? isDeleted;
  bool? isReported;
  bool? isBanUser;
  DateTime? insertDate;
  DateTime? updateDate;

  int? userId;
  int? replyCount;
  int? likeyCount;
  bool? isLikey;
  String? tagString;

  Post({
    this.postId,
    this.title,
    this.content,
    this.author,
    this.authorEnneagramType,
    this.clickCount,
    this.backgroundImageName,
    this.isDeleted,
    this.isReported,
    this.isBanUser,
    this.insertDate,
    this.updateDate,
    this.userId,
    this.replyCount,
    this.likeyCount,
    this.isLikey = false,
    this.tagString = "",
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return 'Post{postId: $postId, title: $title, content: $content, author: $author, authorEnneagramType: $authorEnneagramType, clickCount: $clickCount, backgroundImageName: $backgroundImageName, isDeleted: $isDeleted, isReported: $isReported, isBanUser: $isBanUser, insertDate: $insertDate, updateDate: $updateDate, userId: $userId, replyCount: $replyCount, likeyCount: $likeyCount, isLikey: $isLikey, tagString: $tagString}';
  }
}

List<Post> dummyPosts = [
  Post(postId: 1, title: '제목1입니다.', content: '내용1입니다.', isDeleted: false, author : '띠용', authorEnneagramType : 1),
  Post(postId: 2, title: '제목2입니다.', content: '내용2입니다.', isDeleted: false, author : '띠용1', authorEnneagramType : 2 ),
  Post(postId: 3, title: '제목3입니다.', content: '내용3입니다.', isDeleted: false, author : '띠용2', authorEnneagramType : 3 ),
  Post(postId: 4, title: '제목4입니다.', content: '내용3입니다.', isDeleted: false, author : '띠용4', authorEnneagramType : 4 ),
  Post(postId: 5, title: '제목5입니다.', content: '내용3입니다.', isDeleted: false, author : '띠용5', authorEnneagramType : 3 ),
  Post(postId: 6, title: '제목6입니다.', content: '내용3입니다.', isDeleted: false, author : '띠용6', authorEnneagramType : 3 ),
  Post(postId: 7, title: '제목7입니다.', content: '내용3입니다.', isDeleted: false, author : '띠용7', authorEnneagramType : 3 ),
  Post(postId: 8, title: '제목8입니다.', content: '내용3입니다.', isDeleted: false, author : '띠용8', authorEnneagramType : 3 ),
  Post(postId: 9, title: '제목9입니다.', content: '내용3입니다.', isDeleted: false, author : '띠용9', authorEnneagramType : 3 ),
];

