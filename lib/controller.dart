import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/post_item.dart';
import 'package:wai/models/simply_login_info.dart';

class Controller extends GetxController{
  RxInt count = 0.obs;
  final isGenderList = <bool>[false,false].obs;
  final postItems = <PostItem>[].obs;
  final simpleLoginInfo = Rxn<SimpleLoginInfo>(SimpleLoginInfo(year: 2021, month: 1, day: 1)); // DateTime.now().year
  //final simpleLoginInfo = SimpleLoginInfo(year: 2000, month: 1, day: 1).obs;

  setSimpleLoginInfoYear(int newYear) => simpleLoginInfo.value!.year = newYear;

  setGender(int index) => {

    if (index == 0) {
      simpleLoginInfo.value!.gender = Gender.male
    } else if (index == 1) {
      simpleLoginInfo.value!.gender = Gender.female
    }
  };

  increment() => count++;
}