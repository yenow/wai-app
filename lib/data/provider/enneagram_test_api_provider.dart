import 'dart:convert';

import 'package:wai/common/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/api_util.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/data/model/enneagram/enneagram.dart';
import 'package:wai/data/model/enneagram/enneagram_question.dart';

class EnneagramTestApiProvider {

  getEnneagramQuestionList() async {
    http.Response response = await getApiRequest("/api/enneagramTest/getHardEnneagramQuestion");

    var result = utf8Decoding(response);
    if (response.statusCode == 200) {
      List<EnneagramQuestion> list = List<EnneagramQuestion>.from(
          result.map((model) {
            return EnneagramQuestion.fromJson(model);
          })
      );

      return list;
    } else {
      loggerNoStack.e("error : api request error");
    }
  }

  getSimpleEnneagramQuestionList() async {
    http.Response response = await getApiRequest("/api/enneagramTest/getSimpleEnneagramQuestion");

    if (response.statusCode == 200) {
      String jsonStr = utf8.decode(response.bodyBytes);
      List<EnneagramQuestion> list = List<EnneagramQuestion>.from(
          json.decode(jsonStr).map((model) {
            return EnneagramQuestion.fromJson(model);
          })
      );
      return list;

    } else {
      loggerNoStack.e("error : api request error");
    }
  }
}