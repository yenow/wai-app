
import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/models/enneagram/enneagram_explain.dart';
import 'package:wai/utils/function.dart';

class EnneagramController extends GetxController{
  static EnneagramController get to => Get.put(EnneagramController());
  // final enneagram = Enneagram().obs;
  /* observable variable */
  final enneagramTypePageIndex = 0.obs;
  // final enneagram = {}.obs;
  // final enneagramExplain = {}.obs;
  /* non-observable variable */
  Map<int, Enneagram>? enneagram = {};
  Map<int, EnneagramExplain>? enneagramExplain = {};

  Future<void> initEnneagramInfomation() async {
    
    var response = await getRequest("/api/getEnneagramInfomation");
    List list = json.decode(response as String);
    list.forEach((element) {
      Enneagram temp = Enneagram.fromJson(element);
      enneagram![temp.enneagramType] = temp;
    });
  }

  Future<void> initEnneagramExplainInfomation() async {

    var response = await getRequest("/api/getEnneagramExplainInfomation");
    List list = json.decode(response as String);
    list.forEach((element) {
      EnneagramExplain temp = EnneagramExplain.fromJson(element);
      enneagramExplain![temp.enneagramType] = temp;
    });
  }

  void tabChange(int buttonIndex) {
    enneagramTypePageIndex.value = buttonIndex;
  }

}