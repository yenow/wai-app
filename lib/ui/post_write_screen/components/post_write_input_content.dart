import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/post/post_write_controller.dart';

class PostWriteInputContent extends GetView<PostWriteController> {
  const PostWriteInputContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        cursorColor: WaiColors.white70,
        maxLength: 4000,
        // minLines: 1,
        maxLines: null,
        expands: true,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 20, color: WaiColors.white70),
        controller: TextEditingController(
            text: controller.postSaveRequestDto.value.content
        ),
        onChanged: controller.changeContent,
        decoration: const InputDecoration(
          labelText: "이야기를 적어주세요.",
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
        ),
      ),
    );
  }
}
