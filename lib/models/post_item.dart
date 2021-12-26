class PostItem {
  num post_id;
  String title;
  String content;
  bool is_delete;
  num user_id;
  String nickname;
  num? enneagram_type;

  PostItem({
    required this.post_id,
    required this.title,
    required this.content,
    required this.is_delete,
    required this.user_id,
    required this.nickname,
    this.enneagram_type
  });
}

List<PostItem> postItems = [
  PostItem(post_id: 1, title: '제목입니다.', content: '내용입니다.', is_delete: false, user_id: 1, nickname : '띠용', enneagram_type : 1),
  PostItem(post_id: 2, title: '제목입니다.', content: '내용2입니다.', is_delete: false, user_id: 1, nickname : '띠용1', enneagram_type : 2 ),
  PostItem(post_id: 3, title: '제목입니다.', content: '내용3입니다.', is_delete: false, user_id: 1, nickname : '띠용2', enneagram_type : 3 ),
];

