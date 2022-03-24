import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/post/post_request_dto.dart';
import 'package:wai/data/model/post/post_save_request_dto.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/data/model/reply/reply_request_dto.dart';

part 'reply_client.g.dart';

@RestApi()
abstract class ReplyClient {
  factory ReplyClient(Dio dio, {String baseUrl}) = _ReplyClient;

  @GET('/replies/{postId}')
  Future<List<Reply>> getReplies({
    @Path("postId") required String postId,
    @Header("authorization") required String token
  });

  @POST('/reply/create')
  Future<Reply> createPost({
    @Body() required ReplyRequestDto replyRequestDto,
    @Header("authorization") required String token
  });

  @DELETE('/reply/{replyId}/delete')
  Future<Reply> deletePost({
    @Path("replyId") required String replyId,
    @Header("authorization") required String token
  });

  @POST('/reply/report')
  Future<Reply> reportPost({
    @Body() required ReplyRequestDto replyRequestDto,
    @Header("authorization") required String token
  });
}