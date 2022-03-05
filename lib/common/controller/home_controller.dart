

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/wise_saying/wise_saying.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.put(HomeController());

  final wiseSayings = <WiseSaying>[].obs;

}