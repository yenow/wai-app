

import 'dart:convert';

import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/post.dart';

Future<List<Post>> readMoreNewPosts(List<Post> posts, PostRequestDto postRequestDto) async {

  if (posts.isNotEmpty) {
    postRequestDto.startPostId = posts.elementAt(0).postId;
    postRequestDto.endPostId = posts.elementAt(posts.length - 1).postId;
  } else {
    postRequestDto.startPostId = 0;
    postRequestDto.endPostId = 0;
  }
  logger.d(postRequestDto);

  // api request
  AppController.to.getServerTime();
  var response = await postRequest("/api/readMoreNewPosts", json.encode(postRequestDto.toJson()));

  // add posts
  List<Post> returnList = List<Post>.from(json.decode(response).map((model) {
    return Post.fromJson(model);
  }));
  logger.d(returnList.length);

  return returnList;
}

Future<List<Post>> readMoreOldPosts(List<Post> posts, PostRequestDto postRequestDto,void Function(List<Post>) addOldPostToList) async {

  if (posts.isNotEmpty) {
    postRequestDto.startPostId = posts.elementAt(0).postId;
    postRequestDto.endPostId = posts.elementAt(posts.length - 1).postId;
  }
  logger.d(postRequestDto);

  // api request
  AppController.to.getServerTime();
  var response = await postRequest("/api/readMoreOldPosts", json.encode(postRequestDto.toJson()));

  // add posts
  List<Post> returnList = List<Post>.from(json.decode(response).map((model) {
    return Post.fromJson(model);
  }));
  logger.d(returnList.length);

  if (returnList.length < postRequestDto.postsCount!) {
    PostController.to.isNoMorePost.value = true;
  }

  addOldPostToList(returnList);

  return returnList;
}