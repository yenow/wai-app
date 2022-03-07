import 'package:get/get.dart';
import 'package:wai/controller/hard_enneagram_test_controller.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/controller/simple_enneagram_test_controller.dart';
import 'package:wai/data/provider/simple_enneagram_test_api_provider.dart';
import 'package:wai/data/repository/simple_enneagram_test_repository.dart';
import 'package:wai/ui/introduce_screen/introduction_screen.dart';

class SimpleEnneagramTestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SimpleEnneagramTestController>(
      SimpleEnneagramTestController(
        simpleEnneagramTestRepository: SimpleEnneagramTestRepository(
          simpleEnneagramTestApiProvider: SimpleEnneagramTestApiProvider()
        )
     )
    );
  }
}