import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/ban_user_client.dart';
import 'package:wai/data/client/enneagram_test_client.dart';
import 'package:wai/data/model/ban_user/ban_user.dart';
import 'package:wai/data/model/ban_user/ban_user_request.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';

class BanUserController extends GetxController {
  static BanUserController get to => Get.find();

  final banUsers = <BanUser>[].obs;

  Future<void> getBanUsers() async {
    await BanUserClient(mainDio).getBanUsers(
      userId: UserController.to.user.value.userId!,
      token: AppController.to.getJwtToken()
    ).then((value) {
      banUsers(value);
    });
  }

  void addBanUser(BanUser banUser) {
    banUsers.add(banUser);
  }
}