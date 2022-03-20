import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/controller/permernent/user_controller.dart';
import 'package:wai/data/model/post/post_save_request_dto.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/reply/reply.dart';
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

  /* non-observable variable */
  final int postsCount = 10;
  final int postsPopularCount = 50;
  final formKey = GlobalKey<FormState>();

  bool getIsLikey() {
    bool flag = false;
    for (int userId in post.value.likeys!) {

      if (userId.toString() == UserController.to.user.value.userId!.toString()) {
        flag = true;
        break;
      }
    }
    return flag;
  }

  void addLikey() {
    post.update((val) {
      val!.likeys!.add(int.parse(UserController.to.user.value.userId!.toString()));
      val.likeyCount = val.likeyCount! + 1;
    });

    int postId = post.value.postId!;
    String userId = UserController.to.user.value.userId!.toString();
    getRequest("/api/addLikey/$postId/$userId");
  }

  void removeLikey() {
    post.update((val) {
      val!.likeys!.remove(int.parse(UserController.to.user.value.userId!.toString()));
      val.likeyCount = val.likeyCount! - 1;
    });

    int postId = post.value.postId!;
    String userId = UserController.to.user.value.userId!.toString();
    getRequest("/api/removeLikey/$postId/$userId");
  }

  void setWritingPostTitle (String title) {
    writingPost.value.title = title;
  }

  void setWritingPostContent (String content) {
    writingPost.value.content = content;
  }

  void removeWritingPost () {
    writingPost.value.postId = "";
    writingPost.value.title = "";
    writingPost.value.content = "";
    writingPost.value.author = "";
    writingPost.value.authorEnneagramType = null;
    writingPost.value.userKey = "";
    writingPost.value.userId = "";

  }
}