
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/search/search_controller.dart';
import 'package:wai/data/client/post_client.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/main.dart';

import '../../data/model/post/post_request_dto.dart';

const int maxPostsSize = 10;

class SearchPostController extends GetxController {
  static SearchPostController get to => Get.put(SearchPostController());

  final searchPostsByTag = <Post>[].obs;
  final searchPostsByTitle = <Post>[].obs;
  final searchPostsByAuthor = <Post>[].obs;

  final scrollControllerByTag = ScrollController();
  final scrollControllerByTitle = ScrollController();
  final scrollControllerByAuthor = ScrollController();

  final isLoading = false.obs;

  @override
  void onInit() {
    scrollControllerByTag.addListener(() async {
      if (scrollControllerByTag.position.pixels >= scrollControllerByTag.position.maxScrollExtent - 100 && !isLoading.value
        && searchPostsByTag.isNotEmpty) {
        int endPostId = searchPostsByTag.lastWhere((element) => true).postId!;
        searchPostsByTag.addAll(await getPosts(PostSearchType.tag, endPostId));
      }
    });

    scrollControllerByTitle.addListener(() async {
      if (scrollControllerByTag.position.pixels >= scrollControllerByTag.position.maxScrollExtent - 100 && !isLoading.value
        && searchPostsByTitle.isNotEmpty) {
        int endPostId = searchPostsByTitle.lastWhere((element) => true).postId!;
        searchPostsByTitle.addAll( await getPosts(PostSearchType.title, endPostId));
      }
    });

    scrollControllerByAuthor.addListener(() async {
      if (scrollControllerByTag.position.pixels >= scrollControllerByTag.position.maxScrollExtent - 100 && !isLoading.value
          && searchPostsByAuthor.isNotEmpty) {
        int endPostId = searchPostsByAuthor.lastWhere((element) => true).postId!;
        searchPostsByAuthor.addAll(await getPosts(PostSearchType.author, endPostId));
      }
    });
    super.onInit();
  }

  Future<void> searchPost() async {
    WaiDialog.dialogProgress();
    await onRefreshByTag();
    await onRefreshByTitle();
    await onRefreshByAuthor();
    WaiDialog.closeDialog();
  }

  Future<void> onRefreshByTag() async {
    searchPostsByTag([]);
    searchPostsByTag.addAll(await getPosts(PostSearchType.tag, null));
  }

  Future<void> onRefreshByTitle() async {
    searchPostsByTitle([]);
    searchPostsByTitle.addAll(await getPosts(PostSearchType.title, null));
  }

  Future<void> onRefreshByAuthor() async {
    searchPostsByAuthor([]);
    searchPostsByAuthor.addAll(await getPosts(PostSearchType.author, null));
  }

  Future<List<Post>> getPosts(PostSearchType postSearchType, int? endPostId) async {
    isLoading.value = true;


    PostRequestDto postRequestDto = PostRequestDto(
        maxPostsSize: maxPostsSize,
        endPostId: endPostId,
        searchText: SearchController.to.searchText.value,
        postSearchType: postSearchType
    );

    List<Post> posts = await PostClient(mainDio).getPosts(
      postRequestDto: postRequestDto,
    );

    isLoading.value = false;
    return posts;
  }

}