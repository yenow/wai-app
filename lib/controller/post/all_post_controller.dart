import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/post_client.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/post/post_request_dto.dart';
import 'package:wai/main.dart';

const int maxPostsSize = 10;

class AllPostController extends GetxController {
  static AllPostController get to => Get.find();

  final posts = <Post>[].obs;

  final scrollController = ScrollController();
  final isLoading = false.obs;
  // final hasMore = false.obs;

  @override
  void onInit() {

    scrollController.addListener(() async {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100 && !isLoading.value) {
        await getPost();
      }

    });
    super.onInit();
  }

  Future<void> onRefresh() async {
    posts([]);
    isLoading.value = true;

    PostRequestDto postRequestDto = PostRequestDto(
      userId: UserController.to.user.value.userId,
      maxPostsSize: maxPostsSize,
      postSearchType: PostSearchType.all
    );

    await PostClient(mainDio).getPosts(
        postRequestDto: postRequestDto,
    ).then((value) {

      if (value.isNotEmpty) {
        posts.insertAll(0, value);
      }
    });

    isLoading.value = false;
  }


  Future<void> getPost() async {
    isLoading.value = true;

    await PostClient(mainDio).getPosts(
      postRequestDto: PostRequestDto(
        userId: UserController.to.user.value.userId,
        maxPostsSize: maxPostsSize,
        endPostId: posts.isEmpty ? null : posts.lastWhere((element) => true).postId,
        postSearchType: PostSearchType.all
      ),
    ).then((value) {

      if (value.isNotEmpty) {
        posts.addAll(value);
      } else {
        // WaiDialog.notify('알림', '더 이상 게시글이 없습니다.');
      }
    });

    isLoading.value = false;
  }
}