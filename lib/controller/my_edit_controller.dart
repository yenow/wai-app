import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' hide MultipartFile ;
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:dio/dio.dart' as d;
import 'package:image_picker/image_picker.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/user_controller.dart';
import 'package:wai/data/client/user_client.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/main.dart';

import '../data/model/wai_error.dart';

class MyEditController extends GetxController {
  static MyEditController get to => Get.find();

  var pickerImage = XFile("").obs;
  final nickname = UserController.to.user.value.nickname.obs;
  final errorMessageNickname = ''.obs;

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController(text: UserController.to.user.value.nickname);
  final ImagePicker picker = ImagePicker();

  /* function */
  Future<void> pickImage() async {
    // todo 이미지파일만
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickerImage(image);
    }
    logger.d(image?.path);
    logger.d(image?.name);
  }

  void onSavedNickname(String? value) {
    nickname(value!);
  }

  void onChangedNickname(String? value) {
    formKey.currentState!.validate();
  }

  String? validateNickname(String? nickname) {
    if (nickname!.isEmpty) {
      return "닉네임을 입력해주세요";
    } else if (nickname.length > 10) {
      return "닉네임은 10자리까지 가능합니다.";
    } else if (errorMessageNickname.value.isNotEmpty) {
      return errorMessageNickname.value;
    }
    return null;
  }

  Future<void> clickCompleteButton() async {
    errorMessageNickname('');

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await updateUser();
    }
  }

  Future<void> updateUser() async {
     WaiDialog.dialogProgress();
      
     // todo 확장자에 맞춰서 mime타입 설정
     logger.d(pickerImage.value.name);
     logger.d(pickerImage.value.mimeType);
/*     String mimeType = pickerImage.value.mimeType!;
     String mime = mimeType.split('/')[0];
     String type = mimeType.split('/')[1];*/
     
     d.FormData _formData = d.FormData.fromMap({
       "userId":UserController.to.user.value.userId!,
       "userKey": UserController.to.user.value.userKey,
       "nickname": nickname.value,
       "imageFile": pickerImage.value.path.isNotEmpty
           ? d.MultipartFile.fromFileSync(pickerImage.value.path, filename: pickerImage.value.name, contentType: MediaType("image","jpg"))
            // await d.MultipartFile.fromFile(pickerImage.value.path, filename: pickerImage.value.name, )
           : d.MultipartFile.fromBytes([],filename: "")
     });

     await mainDio.patch("/user/update"
       ,data: _formData
       ,options: Options(
          headers: {
            "authorization" : AppController.to.getJwtToken(),
            "Content-Type" : "multipart/form-data"
          }
        )
     ).then((response) {
         WaiDialog.closeDialog();

         User user = User.fromJson(response.data);
         UserController.to.updateUser(user);
         Get.back(result: user);
       }
     ).catchError((Object error) {
       WaiDialog.closeDialog();
       if (error.runtimeType == DioError) {
         DioError dioError = error as DioError;
         WaiError waiError = WaiError.fromJson(dioError.response?.data);
         if (waiError.errorCode == 'err-101') {
           errorMessageNickname('이미 사용중인 닉네임입니다.');
           formKey.currentState!.validate();
         }
       }
     });
  }

}