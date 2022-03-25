import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/post/all_post_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/post_client.dart';
import 'package:wai/data/model/post/post.dart';
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

    if (postSaveRequestDto.postId == null) {
      PostClient(mainDio).createPost(
          postSaveRequestDto: postSaveRequestDto,
          token: AppController.to.getJwtToken()
      ).then((value) {
        logger.d(value);
        // todo, 내 게시글에 추가,
        AllPostController.to.posts.insert(0, value);
        Get.back(result: value);
        WaiDialog.notify('알림', '글이 등록되었습니다.');
      });

    } else {
      PostClient(mainDio).updatePost(
          postSaveRequestDto: postSaveRequestDto,
          token: AppController.to.getJwtToken()
      ).then((value) {
        logger.d(value);
        Get.back(result: value);
        WaiDialog.notify('알림', '글이 수정되었습니다.');
      });
    }
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

  void setPostSaveRequestDto(Post post) {
    postSaveRequestDto.postId = post.postId!;
    postSaveRequestDto.title = post.title!;
    postSaveRequestDto.tag = post.tagString!;
    postSaveRequestDto.content = post.content!;
  }
}