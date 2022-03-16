import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/data/dto/enneagram_test_request_dto.dart';
import 'package:wai/data/repository/post_write_repository.dart';
import 'package:wai/data/repository/who_am_i_repository.dart';
import 'package:wai/models/post/api/post_save_request_dto.dart';


class PostWriteController extends GetxController {
  static PostWriteController get to => Get.find();
  final PostWriteRepository postWriteRepository;
  PostWriteController({required this.postWriteRepository});

  PostSaveRequestDto postSaveRequestDto = PostSaveRequestDto();
  final formKey = GlobalKey<FormState>();
  
  void savePost() {
    if (checkValue()) {
      return;
    }

    postWriteRepository.savePost(postSaveRequestDto);
  }
  
  bool checkValue() {
    if (postSaveRequestDto.title.isEmpty) {
      WaiDialog.notify('알림', "제목을 작성해야합니다.");
      return false;
    } else if (postSaveRequestDto.content.isEmpty) {
      WaiDialog.notify('알림', "내용을 작성해야합니다.");
    }
    return true;
  }
  
  void changeTitle(String title) {
    postSaveRequestDto.title = title;
  }

  void changeTag(String tag) {
    postSaveRequestDto.tag = tag;
  }

  void changeContent(String content) {
    postSaveRequestDto.content = content;
  }
}