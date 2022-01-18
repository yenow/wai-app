import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/enneagram_question.dart';

class EnneagramTestController extends GetxController {
  static EnneagramTestController get to => Get.put(EnneagramTestController());

  final questionCount = 9;
  final enneagramQuestionList = [].obs;
  final enneagramPageList = [].obs;

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

}