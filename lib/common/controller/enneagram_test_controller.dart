import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/models/enneagram_test/enneagram_question.dart';
import 'package:wai/utils/function.dart';

import 'enneagram_controller.dart';

class EnneagramTestController extends GetxController {
  static EnneagramTestController get to => Get.put(EnneagramTestController());

  /* observable variable */
  final enneagramQuestionList = [].obs;
  final enneagramPageList = [].obs;
  final selectedEnneagramType = 0.obs;
  final nextButtonText = "건너뛰기".obs;

  final simpleEnneagramQuestionList = [].obs;
  final selectSimpleTestMap = {
    1 : "",
    2 : ""
  }.obs;

  /* non-observable variable */
  final questionCount = 15;

  /*
  * Description : 정밀테스트 질문리스트 초기화
  */
  Future<void> initEnneagramQuestionList() async {

    /* api request */
    var response = await getRequest("/api/getHardEnneagramQuestion");

    List<EnneagramQuestion> list = List<EnneagramQuestion>.from(
        json.decode(response).map((model) {
          return EnneagramQuestion.fromJson(model);
        })
    );

    // initEnneagramQuestion();
    // setEnneagramQuestionList(enneagramQuestionList);
    enneagramQuestionList.value = list;
    setEnneagramPageList();

  }

  /*
  * Description : 간단테스트 질문리스트 초기화
  */
  Future<void> initSimpleEnneagramQuestionList() async {

    /* api request */
    var response = await getRequest("/api/getSimpleEnneagramQuestion");

    List<EnneagramQuestion> list = List<EnneagramQuestion>.from(
        json.decode(response).map((model) {
          return EnneagramQuestion.fromJson(model);
        })
    );
    simpleEnneagramQuestionList.value = list;


  }

  // void initEnneagramQuestion() {
  //   enneagramQuestionList.value = [];
  //   enneagramPageList.value = [];
  // }

  // void setEnneagramQuestionList (List<EnneagramQuestion> list) {
  //   enneagramQuestionList.value = list;
  // }

  void setEnneagramPageList() {

    int enneagramQuestionLength = enneagramQuestionList.value.length;

    for (int i=0; i < enneagramQuestionLength; i=i+questionCount) {
      List tempList = [];

      if (i+questionCount > enneagramQuestionLength) {

        for (int j=i; j < enneagramQuestionLength; j++) {
          tempList.add(j);
        }
      } else {

        for (int j=i; j < i+questionCount; j++) {
          tempList.add(j);
        }
      }

      enneagramPageList.value.add(tempList);
    }
  }

  double getProgressPercent() {
    int completeCount = 0;
    for(EnneagramQuestion enneagramQuestion in enneagramQuestionList) {
      if (enneagramQuestion.score != null) {
        completeCount++;
      }
    }
    return completeCount/enneagramQuestionList.length;
  }

  void setScore({required int questionIndex, required int score}) {
    enneagramQuestionList.value[questionIndex].score = score;
  }

  bool checkEnneagramQuestionList() {

    bool flag = true;

    for (var element in enneagramQuestionList.value) {

      if (element.score == null) {
        flag = false;
        break;
      }
    }

    return flag;
  }

  /* final selectedEnneagramType = 0.obs; */
  void selectEnneagramType({required int enneagramType}) {
    selectedEnneagramType.value = enneagramType;
    nextButtonText.value = EnneagramController.to.enneagram![enneagramType]!.getFullName() + '으로 시작하기';
  }

  List<EnneagramQuestion> getSimpleQuestionsByPageIndex(int pageIndex) {
    List<EnneagramQuestion> list = [];

    for (EnneagramQuestion enneagramQuestion in simpleEnneagramQuestionList) {
      if (enneagramQuestion.questionNumber == pageIndex) {
        list.add(enneagramQuestion);
      }
    }
    return list;
  }

  void setSimpleTestSelectMap({required int pageIndex ,required String uniqueString}) {
    selectSimpleTestMap.update(pageIndex,(value) => uniqueString);
  }

  bool checkSimpleEnneagramTestValue() {
    if (selectSimpleTestMap.value[2] == null) {
      return false;
    }

    return true;
  }

  String makeUniqueString() {
    return selectSimpleTestMap.value[1]! + selectSimpleTestMap.value[2]!;
  }
}