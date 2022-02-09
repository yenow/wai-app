
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/toast.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/post.dart';

Future<Post?> readPost(int postId) async {
  PostRequestDto postRequestDto = PostRequestDto(
    postId: postId,
    canUpdateCount: UserController.to.canUpdateCount(postId)
  );
  logger.d(postRequestDto);

  var response = await postRequest("/api/readPost", json.encode(postRequestDto.toJson()));
  Post post = Post.fromJson(json.decode(response));
  return post;
}

Future<List<Post>> initPosts(List<Post> posts, PostRequestDto postRequestDto) async {
  // init
  logger.d(postRequestDto);

  // api request
  var response = await postRequest("/api/readInitPosts", json.encode(postRequestDto.toJson()));

  // add posts
  List<Post> returnList = List<Post>.from(json.decode(response).map((model) {
    return Post.fromJson(model);
  }));
  posts.addAll(returnList);
  logger.d(returnList.length);

  return returnList;
}

Future<List<Post>> readMoreNewPosts(List<Post> posts, PostRequestDto postRequestDto) async {

  if (posts.isNotEmpty) {
    postRequestDto.startPostId = posts.elementAt(0).postId;
    postRequestDto.endPostId = posts.elementAt(posts.length - 1).postId;
  }

  logger.d(postRequestDto);

  // api request
  var response = await postRequest("/api/readMoreNewPosts", json.encode(postRequestDto.toJson()));

  // add posts
  List<Post> returnList = List<Post>.from(json.decode(response).map((model) {
    return Post.fromJson(model);
  }));
  logger.d(returnList.length);

  if (returnList.isEmpty) {
    showToastToTop("더 이상 게시글이 존재하지 않습니다.");
  }

  return returnList;
}

Future<List<Post>> readMoreOldPosts(List<Post> posts, PostRequestDto postRequestDto,void Function(List<Post>) addOldPostToList) async {

  if (posts.isNotEmpty) {
    postRequestDto.startPostId = posts.elementAt(0).postId;
    postRequestDto.endPostId = posts.elementAt(posts.length - 1).postId;
  }
  logger.d(postRequestDto);

  // api request
  var response = await postRequest("/api/readMoreOldPosts", json.encode(postRequestDto.toJson()));

  // add posts
  List<Post> returnList = List<Post>.from(json.decode(response).map((model) {
    return Post.fromJson(model);
  }));
  logger.d(returnList.length);

  if (returnList.isEmpty) {
    showToast("더 이상 게시글이 존재하지 않습니다.");
  }

  addOldPostToList(returnList);

  return returnList;
}