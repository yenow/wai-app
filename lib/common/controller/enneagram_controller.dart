
import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/models/enneagram/enneagram_explain.dart';
import 'package:wai/common/utils/function.dart';

class EnneagramController extends GetxController{
  static EnneagramController get to => Get.put(EnneagramController());
  /* observable variable */
  final enneagramTypePageIndex = 0.obs;
  /* non-observable variable */
  Map<int, Enneagram>? enneagram = {};
  Map<int, EnneagramExplain>? enneagramExplain = {};

  void tabChange(int buttonIndex) {
    enneagramTypePageIndex.value = buttonIndex;
  }
}