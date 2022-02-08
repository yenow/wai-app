import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/user/api/user_request_dto.dart';
import 'package:wai/models/user/user.dart';
import 'package:wai/common/utils/function.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.put(SearchController());

  final searchPostsByContent = <Post>[].obs;
  final searchPostsByTitle = <Post>[].obs;
  final searchPostsByAuthor = <Post>[].obs;
  final recentlySearchList = <String>[].obs;

  void initSearchPost() {
    searchPostsByContent.value = [];
    searchPostsByTitle.value = [];
    searchPostsByAuthor.value = [];
  }

  void addRecentlySearchList(String searchText) {
    recentlySearchList.insert(0, searchText);
  }

  void removerRecentlySearchList(String searchText) {
    recentlySearchList.remove(searchText);
  }
}