import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/post/post_request_dto.dart';
import 'package:wai/data/model/post/post_save_request_dto.dart';

part 'post_client.g.dart';

@RestApi()
abstract class PostClient {
  factory PostClient(Dio dio, {String baseUrl}) = _PostClient;

  @POST('/post/create')
  Future<Post> createPost({
    @Body() required PostSaveRequestDto postSaveRequestDto,
    @Header("authorization") required String token
  });

  @POST('/post/{postId}')
  Future<Post> getPost({
    @Path("postId") required String postId,
    @Header("authorization") required String token
  });

  @POST('/posts')
  Future<List<Post>> getPosts({
    @Body() required PostRequestDto postRequestDto,
  });


  // @POST('/post/newPosts')
  // Future<List<Post>> newPosts({
  //   @Body() required PostRequestDto postRequestDto,
  //   @Header("authorization") required String token
  // });

  // @GET('/post/oldPosts')
  // Future<List<Post>> oldPosts({
  //   @Body() required PostRequestDto postRequestDto,
  //   @Header("authorization") required String token
  // });
}