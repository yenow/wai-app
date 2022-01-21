import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/login/login_info.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/simply_login_info.dart';
import 'package:wai/models/user/user.dart';

class AppController extends GetxController{
  static AppController get to => Get.put(AppController());

  /* observable variable */
  final isInitialized = false.obs;
  final userKey = Rx<String?>("");
  final loginInfo = LoginInfo().obs;
  /* non-observable variable */
  final _accountNameController = TextEditingController(text: 'flutter_secure_storage_service');
  final storage = new FlutterSecureStorage();

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  @override
  void onClose() {
    isInitialized.value = false;
    super.onClose();
  }

  Future<void> initialize() async {
    // 1. user Key 가져오기,  2. DB에서 Login정보 가져와서 넣기
    userKey.value = await _getUserKey();

    loginInfo.update((val) {
      val!.userKey = userKey.value;
    });

    isInitialized.value = true;

    return;
  }

  Future<String?> _getUserKey () async {
    String? userKey = await storage.read(key: "userKey",aOptions: _getAndroidOptions());
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