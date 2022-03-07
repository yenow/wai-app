import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/controller/user_controller.dart';
import 'package:wai/data/model/wai_error.dart';
import 'package:wai/data/model/sign.dart';
import 'package:wai/data/dto/sign_request_dto.dart';
import 'package:wai/data/repository/sign_up_repository.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/who_am_i_screen/who_am_i_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();
  final SignUpRepository signUpRepository;
  SignUpController({required this.signUpRepository});

  final nickname = "".obs;
  final errorMessage = "".obs;
  final flag = false.obs;
  final formKey = GlobalKey<FormState>();

  void setNickname(String? value) {
    nickname(value);
  }

  Future<void> signUpRequest() async {
    errorMessage("");

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      // userKey, password 생성
      String createdUserKey = const Uuid().v4();
      String createdPassword = const Uuid().v4();

      SignRequestDto signRequestDto = SignRequestDto(
        userKey: createdUserKey,
        password: createdPassword,
        nickname: nickname.value
      );

      var result = await signUpRepository.signUpAsNonMember(signRequestDto);

      if (result is Sign) {
        AppController.to.setLoginInfo(result);
        UserController.to.updateUser(result);
        AppController.to.writeLoginInfo(AppController.to.loginInfo.value);
        Get.offAllNamed(WaiRoutes.whoAmI);
      } else if (result is WaiError) {
        WaiError error = result;
        if (error.errorCode == 'err-101') {
          errorMessage('이미 사용중인 닉네임입니다.');
          formKey.currentState!.validate();
        }
      }
    }
  }
}