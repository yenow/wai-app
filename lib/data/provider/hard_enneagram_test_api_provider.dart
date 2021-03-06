import 'dart:convert';

import 'package:wai/common/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/api_util.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/data/model/enneagram/enneagram.dart';
import 'package:wai/data/model/enneagram/enneagram_question.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';

class HardEnneagramTestApiProvider {

  saveHardEnneagramTest(EnneagramTestRequestDto enneagramTestRequestDto) async {
    http.Response response = await postApiRequest("/api/enneagramTest/saveHardEnneagramTest", enneagramTestRequestDto.toJson());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = utf8Decoding(response);
      EnneagramTest enneagramTest = EnneagramTest.fromJson(jsonMap);
      return enneagramTest;
    } else {
      loggerNoStack.e("error : api request error");
    }
  }
}