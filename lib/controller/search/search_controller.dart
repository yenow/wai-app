import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/search/search_post_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/data/model/reply/reply_request_dto.dart';
import 'package:wai/data/model/user/user_request_dto.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/common/utils/function.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.put(SearchController());

  final searchText = ''.obs;

  final searchPostsByContent = <Post>[].obs;
  final searchPostsByTitle = <Post>[].obs;
  final searchPostsByAuthor = <Post>[].obs;
  final recentlySearchList = <String>[].obs;

  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();


  void initSearchPost() {
    searchPostsByContent.value = [];
    searchPostsByTitle.value = [];
    searchPostsByAuthor.value = [];
  }

  void onChangedSearchText(String? value) {
    searchText(value);
  }

  Future<void> search() async {
    if (searchText.value.isEmpty) {
      WaiDialog.notify('알림', '검색어를 입력해주세요.');
      return;
    }
    if (focusNode.hasFocus) focusNode.unfocus();
    await SearchPostController.to.searchPost();
  }

  void addRecentlySearchList(String searchText) {
    recentlySearchList.insert(0, searchText);
  }

  void removerRecentlySearchList(String searchText) {
    recentlySearchList.remove(searchText);
  }
}