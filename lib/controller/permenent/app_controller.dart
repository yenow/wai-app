import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/permenent/post_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/data/model/sign.dart';
import 'package:wai/models/api/response_dto.dart';
import 'package:wai/data/model/login_info.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/sign/sign_dto.dart';
import 'package:wai/data/model/user.dart';
import 'package:wai/common/utils/app_state.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';

import 'enneagram_controller.dart';

class AppController extends GetxController{
  static AppController get to => Get.find();
  // static AppController get to =>  Get.put(AppController());

  /* observable variable */
  final loginInfo = LoginInfo().obs;
  final isWatchIntroducePage = "N".obs;    // IntroducePage 를 봤는지 여부

  final nowServerTime = DateTime(0).obs;
  final appState = AppState().obs;   // appbar 상태

  /* non-observable variable */
  final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();
  final _accountNameController = TextEditingController(text: 'flutter_secure_storage_service');
  final storage = const FlutterSecureStorage();

  void setLoginInfo(Sign sign) {
    loginInfo.update((val) {
      val!.userId = sign.userId.toString();
      val.email = sign.email;
      val.userKey = sign.userKey;
      val.password = sign.password;
      val.token = sign.token;
    });
  }


  void showSnackBar(SnackBar snackBar) {
    snackBarKey.currentState?.showSnackBar(snackBar);
  }

  IOSOptions _getIOSOptions() => IOSOptions(
    accountName: _getAccountName(),
  );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );


  String? _getAccountName() =>
      _accountNameController.text.isEmpty ? null : _accountNameController.text;

  Future<void> getServerTime() async {
    var response = await getServerTimeRequest();
    ResponseDto dto = ResponseDto.fromJson(json.decode(response));
    nowServerTime.value = dto.nowServerTime!;
  }

  Future<void> getLoginInfo() async {
    String? loginInfoJson = await storage.read(
        key: "loginInfo",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );

    logger.d(loginInfoJson);
    LoginInfo tempLoginInfo = LoginInfo.fromJson(json.decode(loginInfoJson ?? "{}"));

    loginInfo.value = tempLoginInfo;
  }

  Future<void> getIsWatchIntroducePage() async {
    String? tempIsWatchIntroducePage = await storage.read(
        key: "isWatchIntroducePage",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );

    isWatchIntroducePage.value = tempIsWatchIntroducePage ?? "";
  }

  Future<void> writeLoginInfo (LoginInfo loginInfo) async {
    loginInfo.token = "";
    await storage.write(key: "loginInfo", value: loginInfo.toJson());
  }

  Future<void> writeIsWatchIntroducePage (String isWatchIntroducePage) async {
    this.isWatchIntroducePage.value = isWatchIntroducePage;
    await storage.write(key: "isWatchIntroducePage", value: isWatchIntroducePage);
  }

  Future<void> removeUserKey () async {
    await storage.delete(
        key: "userKey",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    await storage.delete(
        key: "loginInfo",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    await storage.delete(
        key: "isWatchIntroducePage",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
  }
}