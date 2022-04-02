import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/post/all_post_controller.dart';
import 'package:wai/controller/post/my_post_controller.dart';
import 'package:wai/controller/post/post_background_image_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/post_client.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/post/post_save_request_dto.dart';
import 'package:wai/data/repository/post_write_repository.dart';
import 'package:wai/main.dart';

import '../../common/utils/logger.dart';


class PostWriteController extends GetxController {
  static PostWriteController get to => Get.find();

  final postSaveRequestDto = PostSaveRequestDto(
    userId: UserController.to.user.value.userId!,
    userKey: UserController.to.user.value.userKey,
    author: UserController.to.user.value.nickname,
    authorEnneagramType: UserController.to.currentEnneagramTest.value.myEnneagramType,
    backgroundImageName: PostBackgroundImageController.to.getRandomImageUrl()
  ).obs;
  final formKey = GlobalKey<FormState>();
  
  void savePost() async {
    if (!isValid()) return;

    bool result = await WaiDialog.dialogConfirmation('알림', '정말 등록하시겠습니까?', '아니요', '예');
    if (!result) {
      return;
    }

    if (postSaveRequestDto.value.postId == null) {
      PostClient(mainDio).createPost(
          postSaveRequestDto: postSaveRequestDto.value,
          token: AppController.to.getJwtToken()
      ).then((value) {
        logger.d(value);
        MyPostController.to.posts.insert(0, value);
        AllPostController.to.posts.insert(0, value);
        Get.back(result: value);
        WaiDialog.notify('알림', '글이 등록되었습니다.');
      });

    } else {
      PostClient(mainDio).updatePost(
          postSaveRequestDto: postSaveRequestDto.value,
          token: AppController.to.getJwtToken()
      ).then((value) {
        logger.d(value);
        Get.back(result: value);
        WaiDialog.notify('알림', '글이 수정되었습니다.');
      });
    }
  }
  
  bool isValid() {
    if (postSaveRequestDto.value.title.isEmpty) {
      WaiDialog.notify('알림', "제목을 작성해야합니다.");
      return false;
    } else if (postSaveRequestDto.value.content.isEmpty) {
      WaiDialog.notify('알림', "내용을 작성해야합니다.");
    }
    return true;
  }
  
  void changeTitle(String title) {
    postSaveRequestDto.value.title = title;
  }

  void changeTag(String tag) {
    postSaveRequestDto.value.tag = tag;
  }

  void changeContent(String content) {
    postSaveRequestDto.value.content = content;
  }

  void setPostSaveRequestDto(Post post) {
    postSaveRequestDto.value.postId = post.postId!;
    postSaveRequestDto.value.title = post.title!;
    postSaveRequestDto.value.tag = post.tagString!;
    postSaveRequestDto.value.content = post.content!;
  }

  void changeBackgroundImage() {
    postSaveRequestDto.update((val) {
      val!.backgroundImageName = PostBackgroundImageController.to.getRandomImageUrl();
    });
  }
}