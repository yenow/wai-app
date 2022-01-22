import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:wai/models/enneagram_test/enneagram_question.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/post/write_post.dart';
import 'package:wai/utils/function.dart';

class PostController extends GetxController {
  static PostController get to => Get.put(PostController());

  // observable variable
  final posts = [].obs;
  final writingPost = WritePost().obs;
  final dragDistance = 0.0.obs;
  final isMoreRequesting = false.obs;
  // non-observable variable
  final int postsCount = 10;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  Future<void> initialize() async {
    PostRequestDto postRequestDto = PostRequestDto();
    postRequestDto.postsCount = postsCount;

    var response = await postRequest("/api/readInitPosts", json.encode(postRequestDto.toJson()));
    // Logger().d(response);

    List list = json.decode(response);
    list.forEach((element) {
      posts.add(Post.fromJson(element));
    });
  }

  Future<void> readMoreNewPosts() async {
    print("readMoreNewPosts");
    PostRequestDto postRequestDto = PostRequestDto();
    postRequestDto.postsCount = postsCount;
    postRequestDto.startPostId = posts.value.elementAt(0).postId;
    postRequestDto.endPostId = posts.value.elementAt(posts.value.length - 1).postId;

    var response = await postRequest("/api/readInitPosts", json.encode(postRequestDto.toJson()));
    // var response = await postRequest("/api/readMoreNewPosts", json.encode(postRequestDto.toJson()));
    //Logger().d(response);

    List list = json.decode(response);
    list.forEach((element) {
      posts.insert(0, Post.fromJson(element));
    });
  }

  Future<void> readMoreOldPosts() async {
    print("readMoreOldPosts");
    PostRequestDto postRequestDto = PostRequestDto();
    postRequestDto.postsCount = postsCount;
    postRequestDto.startPostId = posts.value.elementAt(0).postId;
    postRequestDto.endPostId = posts.value.elementAt(posts.value.length - 1).postId;

    var response = await postRequest("/api/readInitPosts", json.encode(postRequestDto.toJson()));
    // var response = await postRequest("/api/readMoreNewPosts", json.encode(postRequestDto.toJson()));
    // Logger().d(response);

    List list = json.decode(response);
    list.forEach((element) {
      posts.insert(0, Post.fromJson(element));
    });
  }

  void setIsMoreRequesting (bool bool) {
    isMoreRequesting.value = bool;
  }

  void setWritingPostTitle (String title) {
    Logger().d(writingPost.value);
    writingPost.value.title = title;
  }

  void setWritingPostContent (String content) {
    Logger().d(writingPost.value);
    writingPost.value.content = content;
  }

}