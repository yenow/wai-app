

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/data/model/login/login_info.dart';

main() async {
  var dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.2:8080/api',
        connectTimeout: 5000,
        receiveTimeout: 3000,
      )
  )..interceptors.add(LogInterceptor(responseBody: true));

  // Get.put<AppController>(AppController());
  // AppController.to.loginInfo.value = loginInfo;

  LoginInfo loginInfo = LoginInfo(
    userKey: "userKey",
    password: "password",
  );


  var response = await dio.post("/sign/signIn", data: loginInfo.toJson());
  logger.d(response);
  logger.d(response.data);
  logger.d(response.data["token"]);
}