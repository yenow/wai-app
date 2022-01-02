import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainController extends GetxController{
  RxInt mainPageCurrentIndex = 0.obs;

  void changeMainPageIndex(int nextPageIndex) {
    mainPageCurrentIndex.value = nextPageIndex;
  }
}