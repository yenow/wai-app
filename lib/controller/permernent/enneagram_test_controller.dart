import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/data/client/enneagram_test_client.dart';
import 'package:wai/data/model/enneagram/enneagram.dart';
import 'package:wai/data/model/enneagram/enneagram_question.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/data/provider/enneagram_test_api_provider.dart';
import 'package:wai/main.dart';

import 'enneagram_controller.dart';

class EnneagramTestController extends GetxController {
  static EnneagramTestController get to => Get.find();

  /* observable variable */
  final enneagramQuestionList = [].obs;
  final enneagramPageList = [].obs;
  final simpleEnneagramQuestionList = [].obs;


  /* non-observable variable */
  final questionCount = 15;

  Future<void> initData() async {
    await initEnneagramQuestionList();
    await initSimpleEnneagramQuestionList();
  }

  Future<void> initEnneagramQuestionList() async {
    EnneagramTestClient(mainDio).getHardEnneagramQuestion().then((value) {
      enneagramQuestionList(value);
      setEnneagramPageList();
    });
  }

  Future<void> initSimpleEnneagramQuestionList() async {
    EnneagramTestClient(mainDio).getSimpleEnneagramQuestion().then((value) {
      simpleEnneagramQuestionList(value);
    });
  }

  void setEnneagramPageList() {

    int enneagramQuestionLength = enneagramQuestionList.length;

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
    enneagramQuestionList[questionIndex].score = score;
  }

  bool checkEnneagramQuestionList() {

    bool flag = true;

    for (var element in enneagramQuestionList) {

      if (element.score == null) {
        flag = false;
        break;
      }
    }

    return flag;
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

  bool checkCurrentPageEnneagramQuestionList(int pageIndex) {
    bool flag = true;
    for (EnneagramQuestion enneagramQuestion in enneagramQuestionList.sublist(pageIndex * questionCount, pageIndex * questionCount + questionCount)) {

      if (enneagramQuestion.score == null) {
        flag = false;
        break;
      }
    }
    return flag;
  }

  void randomInputScore() {
    for (EnneagramQuestion enneagramQuestion in enneagramQuestionList) {

      enneagramQuestion.score = Random().nextInt(5) + 1;
    }
  }

  int getScoreByEneagramType(int enneagramType) {
    int result = 0;
    for (EnneagramQuestion enneagramQuestion in enneagramQuestionList) {

      if (enneagramQuestion.enneagramType == enneagramType) {
        result = result + enneagramQuestion.score!;
      }
    }
    return result;
  }
}