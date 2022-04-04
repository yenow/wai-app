import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/my_edit_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'dart:io';

import '../../../common/widgets/image_container.dart';

class MyEditImageContainer extends GetView<MyEditImageContainer> {
  const MyEditImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
          color: WaiColors.profileBackground,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                WaiColors.mainColor,
                WaiColors.darkMainColor
              ]
          )
      ),
      child: Column(
        children: [
          const Blank(height: 50,),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() => image()),
                  const Blank(height: 5,),
                  /* 이미지 고르기
                  InkWell(
                    onTap: MyEditController.to.pickImage,
                    child: const Icon(
                      Icons.photo_camera_rounded,
                      size: 20,
                      color: WaiColors.white,
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image() {
    if (MyEditController.to.pickerImage.value.path.isEmpty) {
      if (UserController.to.user.value.profileImageFileId == null) {
        return const Center(
          child: Icon(
            Icons.account_circle,
            size: 80,
            color: WaiColors.white,
          ),
        );

      } else {
        return const ImageContainer(
          borderRadius: 40,
          imageUrl: 'https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927',
          width: 80,
          height: 80,
        );
      }

    } else {
      return ClipOval(
        child: Image(
            height: 80,
            width: 80,
            fit: BoxFit.fill,
            image: FileImage(File(MyEditController.to.pickerImage.value.path))
        ),
      );
    }

    // if (UserController.to.user.value.profileImageId == null) {
    //   return const Center(
    //     child: Icon(
    //       Icons.account_circle,
    //       size: 80,
    //       color: WaiColors.white,
    //     ),
    //   );
    //
    // } else if (MyEditController.to.pickerImage.value.path.isEmpty) {
    //   return const ImageContainer(
    //     borderRadius: 40,
    //     imageUrl: 'https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927',
    //     width: 80,
    //     height: 80,
    //   );
    //
    // } else {
    //   return ClipOval(
    //     child: Image(
    //       height: 80,
    //       width: 80,
    //       fit: BoxFit.fill,
    //       image: FileImage(File(MyEditController.to.pickerImage.value.path))
    //     ),
    //   );
    // }
  }
}
