import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/models/enneagram_question.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/post/write_post.dart';

class PostController extends GetxController {
  static PostController get to => Get.put(PostController());

  // observable variable
  final postList = [].obs;
  final writingPost = WritePost().obs;

  void setWritingPostTitle (String title) {
    Logger().d(writingPost.value);
    writingPost.value.title = title;
  }

  void setWritingPostContent (String content) {
    Logger().d(writingPost.value);
    writingPost.value.content = content;
  }

}