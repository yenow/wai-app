
import 'dart:convert';

import 'package:wai/controller/enneagram_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/data/model/enneagram.dart';
import 'package:wai/data/model/enneagram_explain.dart';

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
