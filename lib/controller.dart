import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/post_item.dart';

class Controller extends GetxController{
  RxInt count = 0.obs;
  final postItems = <PostItem>[].obs;

  increment() => count++;
}