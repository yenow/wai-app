import 'package:json_annotation/json_annotation.dart';

part 'notice_request_dto.g.dart';

@JsonSerializable()
class NoticeRequestDto {
  int? noticeId;
  int? recipientUserId;
  int? maxNoticeSize;
  int? lastNoticeId;


  NoticeRequestDto({
    this.noticeId,
    this.recipientUserId,
    this.maxNoticeSize,
    this.lastNoticeId
  });

  factory NoticeRequestDto.fromJson(Map<String, dynamic> json) => _$NoticeRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeRequestDtoToJson(this);
}