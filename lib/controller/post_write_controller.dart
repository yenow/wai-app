import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/user_controller.dart';
import 'package:wai/data/client/post_client.dart';
import 'package:wai/data/model/post/post_save_request_dto.dart';
import 'package:wai/data/repository/post_write_repository.dart';
import 'package:wai/main.dart';

import '../common/utils/logger.dart';


class PostWriteController extends GetxController {
  static PostWriteController get to => Get.find();

  PostSaveRequestDto postSaveRequestDto = PostSaveRequestDto(
    userId: UserController.to.user.value.userId!,
    userKey: UserController.to.user.value.userKey,
    author: UserController.to.user.value.nickname,
    authorEnneagramType: UserController.to.currentEnneagramTest.value.myEnneagramType,
  );
  final formKey = GlobalKey<FormState>();
  
  void savePost() {
    if (!isValid()) return;

    PostClient(mainDio).createPost(
        postSaveRequestDto: postSaveRequestDto,
        token: AppController.to.getJwtToken()
    ).then((value) {
      logger.d(value);
      Get.back();
    });
  }
  
  bool isValid() {
    if (postSaveRequestDto.title.isEmpty) {
      WaiDialog.notify('알림', "제목을 작성해야합니다.");
      return false;
    } else if (postSaveRequestDto.content.isEmpty) {
      WaiDialog.notify('알림', "내용을 작성해야합니다.");
    }
    return true;
  }
  
  void changeTitle(String title) {
    postSaveRequestDto.title = title;
  }

  void changeTag(String tag) {
    postSaveRequestDto.tag = tag;
  }

  void changeContent(String content) {
    postSaveRequestDto.content = content;
  }
}