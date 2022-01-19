class Post {
  num postId;
  String title;
  String content;
  String simpleContent;
  bool isDelete;
  num userId;
  String nickname;
  num? enneagramType;
  num? clickCount;

  Post({
    required this.postId,
    required this.title,
    required this.content,
    required this.simpleContent,
    required this.isDelete,
    required this.userId,
    required this.nickname,
    this.enneagramType
  });
}

List<Post> dummyPosts = [
  Post(postId: 1, title: '제목입니다.', content: '내용입니다.', simpleContent: '내용입니다.', isDelete: false, userId: 1, nickname : '띠용', enneagramType : 1),
  Post(postId: 2, title: '제목입니다.', content: '내용2입니다.',simpleContent: '내용2입니다.', isDelete: false, userId: 1, nickname : '띠용1', enneagramType : 2 ),
  Post(postId: 3, title: '제목입니다.', content: '내용3입니다.',simpleContent: '내용3입니다.', isDelete: false, userId: 1, nickname : '띠용2', enneagramType : 3 ),
];

