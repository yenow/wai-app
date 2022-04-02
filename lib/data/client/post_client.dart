import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/post/post_request_dto.dart';
import 'package:wai/data/model/post/post_save_request_dto.dart';

part 'post_client.g.dart';

@RestApi()
abstract class PostClient {
  factory PostClient(Dio dio, {String baseUrl}) = _PostClient;

  @POST('/post')
  Future<Post> getPost({
    @Body() required PostRequestDto postRequestDto,
    @Header("authorization") required String token
  });

  @POST('/posts')
  Future<List<Post>> getPosts({
    @Body() required PostRequestDto postRequestDto,
  });

  @POST('/post/create')
  Future<Post> createPost({
    @Body() required PostSaveRequestDto postSaveRequestDto,
    @Header("authorization") required String token
  });

  @PUT('/post/update')
  Future<Post> updatePost({
    @Body() required PostSaveRequestDto postSaveRequestDto,
    @Header("authorization") required String token
  });

  @DELETE('/post/delete')
  Future<Post> deletePost({
    @Body() required PostRequestDto postRequestDto,
    @Header("authorization") required String token
  });

  @POST('/post/report')
  Future<Post> reportPost({
    @Body() required PostRequestDto postRequestDto,
    @Header("authorization") required String token
  });

  @POST('/addLikey/{postId}/{userId}')
  Future<Post> addLikey({
    @Path('postId') required String postId,
    @Path('userId') required String userId,
    @Header("authorization") required String token
  });

  @POST('/removeLikey/{postId}/{userId}')
  Future<Post> removeLikey({
    @Path('postId') required String postId,
    @Path('userId') required String userId,
    @Header("authorization") required String token
  });
}