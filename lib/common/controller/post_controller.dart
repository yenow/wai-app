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
import 'package:wai/models/reply/reply.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';

import 'app_controller.dart';

class PostController extends GetxController {
  static PostController get to => Get.put(PostController());

  /* observable variable */
  final posts = <Post>[].obs;
  final popularPosts = <Post>[].obs;
  final myEnneagramPosts = <Post>[].obs;

  final post = Post().obs;

  final writingPost = PostSaveRequestDto().obs;   //PostSaveRequestDto
  final dragDistance = 0.0.obs;
  final isMoreRequesting = false.obs;
  final isNoMorePost = false.obs;

  /* non-observable variable */
  final int postsCount = 10;
  final formKey = GlobalKey<FormState>();

  void addReply(Reply reply) {
    post.update((val) {
      val!.replys!.add(reply);
    });
  }

  bool getIsLikey() {
    bool flag = false;
    for (int userId in post.value.likeys!) {

      if (userId.toString() == AppController.to.userId.value) {
        flag = true;
        break;
      }
    }
    return flag;
  }

  void addLikey() {
    post.update((val) {
      val!.likeys!.add(int.parse(AppController.to.userId.value));
      val.likeyCount = val.likeyCount! + 1;
    });

    int postId = post.value.postId!;
    String userId = AppController.to.userId.value;
    getRequest("/api/addLikey/$postId/$userId");
  }

  void removeLikey() {
    post.update((val) {
      val!.likeys!.remove(int.parse(AppController.to.userId.value));
      val.likeyCount = val.likeyCount! - 1;
    });

    int postId = post.value.postId!;
    String userId = AppController.to.userId.value;
    getRequest("/api/removeLikey/$postId/$userId");
  }

  Future<void> initPosts() async {
    // init
    PostRequestDto postRequestDto = PostRequestDto();
    postRequestDto.postsCount = postsCount;
    logger.d(postRequestDto);

    // api request
    AppController.to.getServerTime();
    var response = await postRequest("/api/readInitPosts", json.encode(postRequestDto.toJson()));

    // add posts
    List list = json.decode(response);
    logger.d(list.length);
    for (var element in list) {
      posts.add(Post.fromJson(element));
    }
  }

  Future<Post?> readPost(int postId) async {

    // api request
    var response = await getRequest("/api/readPost/$postId");

    // add posts
    post.value = Post.fromJson(json.decode(response));

    return post.value;
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