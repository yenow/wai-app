

import 'dart:convert';

import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/post.dart';

Future<void> readMoreNewPosts(List<Post> posts, PostRequestDto postRequestDto) async {
  // init
  // PostRequestDto postRequestDto = PostRequestDto();
  // postRequestDto.postsCount = postsCount;
  //
  // if (posts.isNotEmpty) {
  //   postRequestDto.startPostId = posts.elementAt(0).postId;
  //   postRequestDto.endPostId = posts.elementAt(posts.length - 1).postId;
  // } else {
  //   postRequestDto.startPostId = 0;
  //   postRequestDto.endPostId = 0;
  // }
  logger.d(postRequestDto);

  // api request
  AppController.to.getServerTime();
  var response = await postRequest("/api/readMoreNewPosts", json.encode(postRequestDto.toJson()));

  // add posts
  List list = json.decode(response);
  logger.d(list.length);
  for (var element in list) {
    posts.insert(0, Post.fromJson(element));
  }
}