import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/models/api/response_dto.dart';
import 'package:wai/models/login/login_info.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/simply_login_info.dart';
import 'package:wai/models/user/user.dart';
import 'package:wai/utils/app_state.dart';
import 'package:wai/utils/function.dart';

import 'enneagram_controller.dart';

class AppController extends GetxController{
  static AppController get to => Get.put(AppController());

  /* observable variable */
  final userKey = Rx<String?>("");
  final userId = Rx<String?>("");
  final isBuildIntroducePage = Rx<String?>("");
  final nowServerTime = DateTime(0).obs;
  final appState = AppState().obs;   // appbar 상태

  /* non-observable variable */
  final _accountNameController = TextEditingController(text: 'flutter_secure_storage_service');
  final storage = new FlutterSecureStorage();

  Future<bool> initAppState() async {
    userKey.value = await getUserKey();
    userId.value = await getUserId();
    isBuildIntroducePage.value = await getIsBuildIntroducePage();
    getServerTime();
    await EnneagramController.to.initEnneagramInfomation();
    await EnneagramTestController.to.initEnneagramQuestionList();
    await EnneagramTestController.to.initSimpleEnneagramQuestionList();
    return true;
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

  Future<String?> getUserKey() async {
    String? userKey = await storage.read(
        key: "userKey",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    return userKey;
  }

  Future<String?> getUserId() async {
    String? userKey = await storage.read(
        key: "userId",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    return userKey;
  }

  Future<String?> getIsBuildIntroducePage() async {
    String? isBuildIntroducePage = await storage.read(
        key: "isBuildIntroducePage",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    return isBuildIntroducePage;
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



















  RxInt count = 0.obs;
  final isGenderList = <bool>[true,false].obs;
  final postItems = <Post>[].obs;
  final simpleLoginInfo = Rxn<SimpleLoginInfo>(SimpleLoginInfo(year: 2021, month: 1, day: 1)); // DateTime.now().year
  // final simpleLoginInfo = SimpleLoginInfo(year: 2021, month: 1, day: 1).obs; // DateTime.now().year

  setSimpleLoginInfoYear(int newYear) => simpleLoginInfo.value!.year = newYear;

  setNickname(String value) => simpleLoginInfo.value!.nickname = value;

  setBirthDay(String value) => simpleLoginInfo.value!.birthDay = value;

  setGender(int index) => {

    if (index == 0) {
      simpleLoginInfo.value!.gender = 'man',
      isGenderList.value = <bool>[true,false].obs
    } else if (index == 1) {
      simpleLoginInfo.value!.gender = 'woman',
      isGenderList.value = <bool>[false,true].obs
    }
  };

  increment() => count++;
}