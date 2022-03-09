import 'dart:convert';

import 'package:wai/common/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/data/model/enneagram.dart';
import 'package:wai/data/model/enneagram_question.dart';

class EnneagramApiProvider {

  getEnneagramInformation() async {
     http.Response response = await getApiRequest("/api/enneagram/getEnneagramInformation");

     if (response.statusCode == 200) {
       List list = json.decode(utf8.decode(response.bodyBytes));
       Map<int, Enneagram>? enneagramMap = {};

       for (var element in list) {
         Enneagram temp = Enneagram.fromJson(element);
         enneagramMap[temp.enneagramType] = temp;
       }
       return enneagramMap;
     } else {
       loggerNoStack.e("error : api request error");
     }
  }
}