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

class MyEnneagramPostController extends GetxController {
  static MyEnneagramPostController get to => Get.find();

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

    await getPost();

    isLoading.value = false;
  }


  Future<void> getPost() async {
    isLoading.value = true;

    PostRequestDto postRequestDto = PostRequestDto(
        maxPostsSize: maxPostsSize,
        endPostId: posts.isEmpty ? null : posts.lastWhere((element) => true).postId,
        myEnneagramType: UserController.to.currentEnneagramTest.value.myEnneagramType,
        postSearchType: PostSearchType.enneagramType
    );

    await PostClient(mainDio).getPosts(
        postRequestDto: postRequestDto,
    ).then((value) {

      if (value.isNotEmpty) {
        posts.addAll(value);
      }
    });

    isLoading.value = false;
  }
}