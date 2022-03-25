
import 'package:get/get.dart';
import 'package:wai/controller/search/search_controller.dart';
import 'package:wai/controller/search/search_post_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SearchController>(SearchController());
    Get.put<SearchPostController>(SearchPostController());
  }
}