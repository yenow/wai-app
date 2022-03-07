
import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/data/model/enneagram.dart';
import 'package:wai/data/model/enneagram_explain.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/data/provider/enneagram_api_provider.dart';

import '../common/utils/logger.dart';

class EnneagramController extends GetxController{
  static EnneagramController get to => Get.find();
  /* observable variable */
  final enneagramTypePageIndex = 0.obs;
  /* non-observable variable */
  Map<int, Enneagram>? enneagram = {};
  Map<int, EnneagramExplain>? enneagramExplain = {};

  Future<void> initEnneagram() async {
    enneagram = await EnneagramApiProvider().getEnneagramInformation();
  }

  void tabChange(int buttonIndex) {
    enneagramTypePageIndex.value = buttonIndex;
  }
}