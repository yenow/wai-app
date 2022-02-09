import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/models/api/response_dto.dart';
import 'package:wai/models/login/login_info.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/simply_login_info.dart';
import 'package:wai/models/user/user.dart';
import 'package:wai/common/utils/app_state.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';

import 'enneagram_controller.dart';

class AppController extends GetxController{
  static AppController get to => Get.put(AppController());

  /* observable variable */
  final userKey = "".obs;  // Rx<String?>("");
  final userId = "".obs;
  final isBuildIntroducePage = "".obs;
  final nowServerTime = DateTime(0).obs;
  final appState = AppState().obs;   // appbar 상태

  /* non-observable variable */
  final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
  final _accountNameController = TextEditingController(text: 'flutter_secure_storage_service');
  final storage = const FlutterSecureStorage();

  void showSnackBar(SnackBar snackBar) {
    snackbarKey.currentState?.showSnackBar(snackBar);
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

  Future<void> initUserKey() async {
    String? tempUserKey = await storage.read(
        key: "userKey",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );

    userKey.value = tempUserKey ?? "";
    loggerNoStack.d("userKey :" + userKey.value);
  }

  Future<void> initUserId() async {
    String? temUserId = await storage.read(
        key: "userId",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );

    userId.value = temUserId ?? "";
    loggerNoStack.d("userKey :" + userId.value);
  }

  Future<void> initIsBuildIntroducePage() async {
    String? tempIsBuildIntroducePage = await storage.read(
        key: "isBuildIntroducePage",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    isBuildIntroducePage.value = tempIsBuildIntroducePage ?? "";
  }

  Future<void> writeUserKey (String userKey) async {
    this.userKey.value = userKey;
    await storage.write(key: "userKey", value: userKey);
  }

  Future<void> writeUserId (String userId) async {
    this.userId.value = userId;
    await storage.write(key: "userId", value: userId);
  }

  Future<void> writeIsBuildIntroducePage (String isBuildIntroducePage) async {
    this.isBuildIntroducePage.value = isBuildIntroducePage;
    await storage.write(key: "isBuildIntroducePage", value: isBuildIntroducePage);
  }

  Future<void> removeUserKey () async {
    await storage.delete(
        key: "userKey",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    await storage.delete(
        key: "userId",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    await storage.delete(
        key: "isBuildIntroducePage",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
  }
}