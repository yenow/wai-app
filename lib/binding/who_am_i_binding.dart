import 'package:get/get.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/controller/sign_up_controller.dart';
import 'package:wai/controller/who_am_i_controller.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';
import 'package:wai/data/provider/who_am_i_api_provider.dart';
import 'package:wai/data/repository/sign_up_repository.dart';
import 'package:wai/data/repository/who_am_i_repository.dart';

class WhoAmIBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WhoAmIController>(
      WhoAmIController(
        whoAmIRepository: WhoAmIRepository(
            whoAmIApiProvider: WhoAmIApiProvider()
        )
      )
    );
  }
}