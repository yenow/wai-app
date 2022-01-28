import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/models/enneagram_test/enneagram_question.dart';

import 'enneagram_controller.dart';

class EnneagramTestController extends GetxController {
  static EnneagramTestController get to => Get.put(EnneagramTestController());

  /* observable variable */
  final enneagramQuestionList = [].obs;
  final enneagramPageList = [].obs;
  final selectedEnneagramType = 0.obs;
  final nextButtonText = "건너뛰기".obs;
  /* non-observable variable */
  final questionCount = 9;

  void setEnneagramQuestion(List<EnneagramQuestion> list) {
    initEnneagramQuestion();
    setEnneagramQuestionList(list);
    setEnneagramPageList();
  }

  void setEnneagramQuestionList (List<EnneagramQuestion> list) {
    enneagramQuestionList.value = list;
  }

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

  void initEnneagramQuestion() {
    enneagramQuestionList.value = [];
    enneagramPageList.value = [];
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
}