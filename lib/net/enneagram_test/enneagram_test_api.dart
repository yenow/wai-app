

import 'dart:convert';

import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/data/model/enneagram.dart';
import 'package:wai/data/model/enneagram_explain.dart';
import 'package:wai/data/model/enneagram_question.dart';

/*
  * Description : 정밀테스트 질문리스트 초기화
  */
Future<void> initEnneagramQuestionList() async {

  /* api request */
  var response = await getRequest("/api/enneagramTest/getHardEnneagramQuestion");

  List<EnneagramQuestion> list = List<EnneagramQuestion>.from(
      json.decode(response).map((model) {
        return EnneagramQuestion.fromJson(model);
      })
  );

  // initEnneagramQuestion();
  // setEnneagramQuestionList(enneagramQuestionList);
  EnneagramTestController.to.enneagramQuestionList.value = list;
  EnneagramTestController.to.setEnneagramPageList();
}

/*
  * Description : 간단테스트 질문리스트 초기화
  */
Future<void> initSimpleEnneagramQuestionList() async {

  /* api request */
  var response = await getRequest("/api/enneagramTest/getSimpleEnneagramQuestion");

  List<EnneagramQuestion> list = List<EnneagramQuestion>.from(
      json.decode(response).map((model) {
        return EnneagramQuestion.fromJson(model);
      })
  );
  EnneagramTestController.to.simpleEnneagramQuestionList.value = list;
}