
import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/data/client/enneagram_client.dart';
import 'package:wai/data/model/enneagram/enneagram.dart';
import 'package:wai/data/model/enneagram/enneagram_explain.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/data/provider/enneagram_api_provider.dart';
import 'package:wai/main.dart';

import '../../common/utils/logger.dart';

class EnneagramController extends GetxController{
  static EnneagramController get to => Get.find();

  Map<int, Enneagram> enneagram = {};

  void initEnneagram() {
    EnneagramClient(dio).getEnneagramInformation().then((value) {
      for (Enneagram temp in value) {
        enneagram[temp.enneagramType] = temp;
      }
    });
  }
}