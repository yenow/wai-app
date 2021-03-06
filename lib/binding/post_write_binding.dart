import 'package:get/get.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/controller/post/post_write_controller.dart';
import 'package:wai/controller/sign/sign_up_controller.dart';
import 'package:wai/controller/who_am_i_controller.dart';
import 'package:wai/data/provider/post_write_api_provider.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';
import 'package:wai/data/provider/who_am_i_api_provider.dart';
import 'package:wai/data/repository/post_write_repository.dart';

class PostWriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PostWriteController>(
      PostWriteController()
    );
  }
}