import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wai/controller/post/post_write_controller.dart';

import '../../../constants/wai_colors.dart';

class PostWriteInputTag extends GetView<PostWriteController> {
  const PostWriteInputTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          cursorColor: Colors.grey,
          maxLength: 100,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLines: 1,
          style: const TextStyle(fontSize: 20, color: WaiColors.white70),
          controller: TextEditingController(
              text: controller.postSaveRequestDto.tag
          ),
          onChanged: controller.changeTag,
          decoration: const InputDecoration(
            labelText: "태그를 입력해주세요.",
            labelStyle: TextStyle(fontSize: 20, color: WaiColors.white70),
            floatingLabelBehavior: FloatingLabelBehavior.never,

            fillColor: Colors.transparent,
            filled: true,
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.transparent),
            ),
            enabledBorder: UnderlineInputBorder (
              borderSide: BorderSide(width: 0.5, color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.transparent),
            ),
            counterText:'',
          )
      ),
    );
  }
}
