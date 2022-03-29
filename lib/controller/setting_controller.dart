import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/enneagram_test_client.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';

class SettingController extends GetxController {
  static SettingController get to => Get.find();


  void logout() async {
    
    bool result = await WaiDialog.dialogConfirmation('알림', '로그아웃 하시겠습니까?', '아니요', '예');
    logger.d(result);

  }
}