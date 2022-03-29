import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/model/wai_error.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/sign/sign_request_dto.dart';
import 'package:wai/data/client/sign_client.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/who_am_i_screen/who_am_i_screen.dart';

import '../../main.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();
}