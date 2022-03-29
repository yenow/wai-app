
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/notice/notice.dart';
import 'package:wai/data/model/notice/notice_request_dto.dart';
import 'package:wai/data/model/response_dto.dart';

part 'notice_client.g.dart';

@RestApi()
abstract class NoticeClient {
  factory NoticeClient(Dio dio, {String baseUrl}) = _NoticeClient;

  @POST('/notices')
  Future<List<Notice>> getNotices({
    @Body() required NoticeRequestDto noticeRequestDto,
    @Header("authorization") required String token
  });

  @POST('/notice/clear')
  Future<Notice> clearNotice({
    @Body() required NoticeRequestDto noticeRequestDto,
    @Header("authorization") required String token
  });

  @POST('/notice/clearAll')
  Future<ResponseDto> clearAllNotice({
    @Body() required NoticeRequestDto noticeRequestDto,
    @Header("authorization") required String token
  });
}