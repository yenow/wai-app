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

import '../main.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();

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

      SignRequestDto signRequestDto = SignRequestDto(
        nickname: nickname.value
      );

      // var result = await signUpRepository.signUpAsNonMember(signRequestDto);

      await SignClient(mainDio).signUpAsNonMember(signRequestDto: signRequestDto).then((result) {
        AppController.to.setLoginInfo(result);
        UserController.to.updateUserBySign(result);
        AppController.to.writeLoginInfo(AppController.to.loginInfo.value);
        Get.offAllNamed(WaiRoutes.whoAmI);

      }).catchError((Object error) {
        if (error.runtimeType == DioError) {
          DioError dioError = error as DioError;
          WaiError waiError = WaiError.fromJson(dioError.response?.data);
          if (waiError.errorCode == 'err-101') {
            errorMessage('이미 사용중인 닉네임입니다.');
            formKey.currentState!.validate();
          }
        }
      });

      // if (result is Sign) {
      //   AppController.to.setLoginInfo(result);
      //   UserController.to.updateUser(result);
      //   AppController.to.writeLoginInfo(AppController.to.loginInfo.value);
      //   Get.offAllNamed(WaiRoutes.whoAmI);
      //
      // } else if (result is WaiError) {
      //   WaiError error = result;
      //   if (error.errorCode == 'err-101') {
      //     errorMessage('이미 사용중인 닉네임입니다.');
      //     formKey.currentState!.validate();
      //   }
      // }
    }
  }
}