


import 'dart:convert';

import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/models/enneagram/enneagram_explain.dart';

Future<void> initEnneagramInformation() async {

  var response = await getRequest("/api/enneagram/getEnneagramInformation");
  List list = json.decode(response as String);

  for (var element in list) {
    Enneagram temp = Enneagram.fromJson(element);
    EnneagramController.to.enneagram![temp.enneagramType] = temp;
  }
}

Future<void> initEnneagramExplainInformation() async {

  var response = await getRequest("/api/enneagram/getEnneagramExplainInformation");
  List list = json.decode(response as String);
  for (var element in list) {
    EnneagramExplain temp = EnneagramExplain.fromJson(element);
    EnneagramController.to.enneagramExplain![temp.enneagramType] = temp;
  }
}
