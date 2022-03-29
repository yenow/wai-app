import 'package:json_annotation/json_annotation.dart';
import 'package:wai/data/model/notice/notice_type.dart';

part 'notice.g.dart';

@JsonSerializable()
class Notice {
  int? noticeId;
  String? giverNickname;
  int? targetPostId;
  int? targetReplyId;

  NoticeType? noticeType;
  String? content;
  bool? isRead;

  DateTime? insertDate;


  Notice(
      this.noticeId,
      this.giverNickname,
      this.targetPostId,
      this.targetReplyId,
      this.noticeType,
      this.content,
      this.isRead,
      this.insertDate);

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}