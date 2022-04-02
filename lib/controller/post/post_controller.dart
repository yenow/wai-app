import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/ban_user_controller.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/ban_user_client.dart';
import 'package:wai/data/client/post_client.dart';
import 'package:wai/data/client/user_client.dart';
import 'package:wai/data/model/ban_user/ban_user_request.dart';
import 'package:wai/data/model/post/post_request_dto.dart';
import 'package:wai/data/model/post/post_save_request_dto.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';

class PostController extends GetxController {
  static PostController get to => Get.put(PostController());
  final post = Post().obs;

  Future<Post> getPost(String postId) async {
    PostRequestDto postRequestDto = PostRequestDto(
      postId: int.parse(postId),
      userId: UserController.to.user.value.userId,
    );

    await PostClient(mainDio).getPost(
        postRequestDto: postRequestDto,
        token: AppController.to.getJwtToken()
    ).then((value) {
      post(value);
    }
    ).catchError((Object error) {
      Get.back();
    });

    return post.value;
  }

  void goReplyPage() async {
    var repliesLength = await Get.toNamed(WaiRoutes.reply + '/${post.value.postId}');

    if (repliesLength is int) {
      post.update((val) {
        val!.replyCount = repliesLength;
      });
    }
  }

  void clickLikey() async {
    if (post.value.isLikey!) {
      await PostClient(mainDio).removeLikey(
          postId: post.value.postId.toString(), 
          userId: UserController.to.user.value.userId.toString(), 
          token: AppController.to.getJwtToken()
      ).then((value) {
        post.update((val) {
          val!.likeyCount = val.likeyCount! - 1;
          val.isLikey = false;
        });
      });

    } else {
      await PostClient(mainDio).addLikey(
          postId: post.value.postId.toString(),
          userId: UserController.to.user.value.userId.toString(),
          token: AppController.to.getJwtToken()
      ).then((value) {
        post.update((val) {
          val!.likeyCount = val.likeyCount! + 1;
          val.isLikey = true;
        });
      });

    }
  }

  void clickUpdate() async {
    Post tempPost = await Get.toNamed(WaiRoutes.postWrite, arguments: post.value);
    logger.d(tempPost);
    post(tempPost);
  }

  void clickDelete() async {

    await PostClient(mainDio).deletePost(
      postRequestDto: PostRequestDto(
        postId: post.value.postId
      ),
      token: AppController.to.getJwtToken()
    ).then((value) {
      Get.back(result: value);
      WaiDialog.notify('알림','글이 삭제되었습니다.');
    });
  }

  void clickReport() async {
    await PostClient(mainDio).reportPost(
        postRequestDto: PostRequestDto(
            postId: post.value.postId
        ),
        token: AppController.to.getJwtToken()
    ).then((value) {
      Get.back(result: value);
      WaiDialog.notify('알림','글이 신고되었습니다.');
    });
  }

  void clickBanUser() async {
    await BanUserClient(mainDio).createBanUser(
        banUserRequest: BanUserRequest(
          userId: UserController.to.user.value.userId,
          banUserId: PostController.to.post.value.userId,
        ),
        token: AppController.to.getJwtToken()
    ).then((value) {
      BanUserController.to.addBanUser(value);
      post.update((val) {
        val!.isBanUser = true;
      });
      Get.back(result: post.value);
      WaiDialog.notify('알림','사용자를 차단하였습니다.');
    });
  }
}