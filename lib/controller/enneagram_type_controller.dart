import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/data/repository/who_am_i_repository.dart';

class EnneagramTypeController extends GetxController {
  static EnneagramTypeController get to => Get.find();
}