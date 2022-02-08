


import 'dart:convert';

import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/models/enneagram/enneagram.dart';

Future<void> initEnneagramInfomation() async {

  var response = await getRequest("/api/getEnneagramInfomation");
  List list = json.decode(response as String);

  for (var element in list) {
    Enneagram temp = Enneagram.fromJson(element);
    EnneagramController.to.enneagram![temp.enneagramType] = temp;
  }
}