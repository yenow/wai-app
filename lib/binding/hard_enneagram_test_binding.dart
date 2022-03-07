import 'package:get/get.dart';
import 'package:wai/controller/hard_enneagram_test_controller.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/data/provider/hard_enneagram_test_api_provider.dart';
import 'package:wai/ui/introduce_screen/introduction_screen.dart';

import '../data/repository/hard_enneagram_test_repository.dart';

class HardEnneagramTestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HardEnneagramTestController>(HardEnneagramTestController(
      hardEnneagramTestRepository: HardEnneagramTestRepository(
        hardEnneagramTestApiProvider: HardEnneagramTestApiProvider()
      )
    ));
  }
}