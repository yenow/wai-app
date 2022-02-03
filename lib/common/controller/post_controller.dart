import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/api/post_save_request_dto.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/utils/function.dart';

class PostController extends GetxController {
  static PostController get to => Get.put(PostController());

  // observable variable
  final posts = [].obs;
  final writingPost = PostSaveRequestDto().obs;   //PostSaveRequestDto
  final dragDistance = 0.0.obs;
  final isMoreRequesting = false.obs;
  // non-observable variable
  final int postsCount = 10;
  final formKey = GlobalKey<FormState>();

  Future<void> initPosts() async {
    // init
    PostRequestDto postRequestDto = PostRequestDto();
    postRequestDto.postsCount = postsCount;

    // api request
    var response = await postRequest("/api/readInitPosts", json.encode(postRequestDto.toJson()));

    // add posts
    List list = json.decode(response);
    for (var element in list) {
      posts.add(Post.fromJson(element));
    }
  }

  Future<void> readMoreNewPosts() async {
    // init
    PostRequestDto postRequestDto = PostRequestDto();
    postRequestDto.postsCount = postsCount;

    if (posts.value.isNotEmpty) {
      postRequestDto.startPostId = posts.value.elementAt(0).postId;
      postRequestDto.endPostId = posts.value.elementAt(posts.value.length - 1).postId;
    } else {
      postRequestDto.startPostId = 0;
      postRequestDto.endPostId = 0;
    }
    logger.d(postRequestDto);

    // api request
    var response = await postRequest("/api/readMoreNewPosts", json.encode(postRequestDto.toJson()));

    // add posts
    List list = json.decode(response);
    for (var element in list) {
      posts.insert(0, Post.fromJson(element));
    }
  }

  Future<void> readMoreOldPosts() async {
    // init
    PostRequestDto postRequestDto = PostRequestDto();
    postRequestDto.postsCount = postsCount;

    if (posts.value.isNotEmpty) {
      postRequestDto.startPostId = posts.value.elementAt(0).postId;
      postRequestDto.endPostId = posts.value.elementAt(posts.value.length - 1).postId;
    } else {
      postRequestDto.startPostId = 0;
      postRequestDto.endPostId = 0;
    }

    // api request
    var response = await postRequest("/api/readMoreNewPosts", json.encode(postRequestDto.toJson()));

    // add posts
    List list = json.decode(response);
    for (var element in list) {
      posts.insert(0, Post.fromJson(element));
    }
  }

  Future<Post?> readPost(int postId) async {

    // api request
    var response = await getRequest("/api/readPost/$postId");

    // add posts
    Post? post = Post.fromJson(json.decode(response));
    return post;
  }

  void setWritingPostTitle (String title) {
    writingPost.value.title = title;
  }

  void setWritingPostContent (String content) {
    writingPost.value.content = content;
  }

  void removeWritingPost () {
    writingPost.value.title = "";
    writingPost.value.content = "";
  }

  void setIsMoreRequesting (bool bool) {
    isMoreRequesting.value = bool;
  }
}