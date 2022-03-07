import 'dart:convert';

import 'package:wai/common/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/api_util.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/enneagram_test_controller.dart';
import 'package:wai/data/dto/enneagram_test_request_dto.dart';
import 'package:wai/data/model/enneagram.dart';
import 'package:wai/data/model/enneagram_question.dart';
import 'package:wai/data/model/enneagram_test.dart';

class SimpleEnneagramTestApiProvider {

  saveSimpleEnneagramTest(EnneagramTestRequestDto enneagramTestRequestDto) async {
    http.Response response = await postApiRequest("/api/enneagramTest/saveSimpleEnneagramTest", enneagramTestRequestDto.toJson());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = utf8Decoding(response);
      EnneagramTest enneagramTest = EnneagramTest.fromJson(jsonMap);
      return enneagramTest;

    } else {
      loggerNoStack.e("error : api request error");
    }
  }
}