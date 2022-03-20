
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/data/client/enneagram_client.dart';
import 'package:wai/data/client/enneagram_test_client.dart';
import 'package:wai/data/client/user_client.dart';
import 'package:wai/data/model/enneagram/enneagram.dart';
import 'package:wai/data/model/enneagram/enneagram_question.dart';
import 'package:wai/data/model/login/login_info.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

import '../../api/test_dio.dart';

main() async {

  Get.put<AppController>(AppController());
  LoginInfo loginInfo = LoginInfo(
    userKey: "userKey",
    password: "password",
  );
  var response = await testDio.post("/sign/signIn", data: loginInfo.toJson());
  AppController.to.setLoginInfo(Sign.fromJson(response.data));



  EnneagramTestClient enneagramClient = EnneagramTestClient(testDio);
  await enneagramClient.getHardEnneagramQuestion().then((value) {
    List<EnneagramQuestion> enneagramQuestions = value;
    logger.d(enneagramQuestions);
  });

  await enneagramClient.getSimpleEnneagramQuestion().then((value) {
    List<EnneagramQuestion> enneagramQuestions = value;
    logger.d(enneagramQuestions);
  });
}

main2() async {

  Get.put<AppController>(AppController());
  LoginInfo loginInfo = LoginInfo(
    userKey: "userKey",
    password: "password",
  );
  var response = await testDio.post("/sign/signIn", data: loginInfo.toJson());
  AppController.to.setLoginInfo(Sign.fromJson(response.data));



  EnneagramTestClient enneagramClient = EnneagramTestClient(testDio);
}