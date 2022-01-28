import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/models/login/login_info.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/simply_login_info.dart';
import 'package:wai/models/user/user.dart';
import 'package:wai/utils/app_state.dart';

import 'enneagram_controller.dart';

class AppController extends GetxController{
  static AppController get to => Get.put(AppController());

  /* observable variable */
  final isInitialized = false.obs;
  final userKey = Rx<String?>(""); // "".obs;
  final userId = Rx<String?>(""); // "".obs;
  final loginInfo = LoginInfo().obs;
  final appState = AppState().obs;   // appbar 상태
  /* non-observable variable */
  final _accountNameController = TextEditingController(text: 'flutter_secure_storage_service');
  final storage = new FlutterSecureStorage();

  // @override
  // void onInit() {
  //   initialize();
  //   super.onInit();
  // }

  /*@override
  void onClose() {
    isInitialized.value = false;
    super.onClose();
  }*/

  Future<bool> initAppState() async {
    initUserKeyAndUserId();
    await EnneagramController.to.initEnneagramInfomation();
    //await EnneagramController.to.initEnneagramExplainInfomation();
    return true;
  }

  Future<void> initUserKeyAndUserId() async {
    // get UserKey, UserId
    userKey.value = await getUserKey();
    userId.value = await getUserId();
    Logger().d("userKey : " + userKey.value!);
    Logger().d("userId : " + userId.value! != null ? userId.value : "");

    // get UserInfo by DB


    // update LoginInfo
    loginInfo.update((val) {
      val!.userKey = userKey.value;
    });

    isInitialized.value = true;
  }

  Future<String?> getUserKey () async {
    String? userKey = await storage.read(
        key: "userKey",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    return userKey;
  }

  Future<String?> getUserId () async {
    String? userKey = await storage.read(
        key: "userId",
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions()
    );
    return userKey;
  }

  IOSOptions _getIOSOptions() => IOSOptions(
    accountName: _getAccountName(),
  );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );


  String? _getAccountName() =>
      _accountNameController.text.isEmpty ? null : _accountNameController.text;


  void setLoginInfo (User user) {
    loginInfo.update((val) {
      val!.userId = user.userId;
    });
  }

  Future<void> writeUserKey (String userKey) async {
    this.userKey.value = userKey;
    await storage.write(key: "userKey", value: userKey);
  }

  Future<void> writeUserId (String userId) async {
    this.userId.value = userId;
    await storage.write(key: "userId", value: userId);
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