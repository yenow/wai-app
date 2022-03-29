import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/post/post_background_image_controller.dart';
import 'package:wai/controller/post/post_write_controller.dart';
import 'package:wai/ui/post_write_screen/image_select_screen/image_select_screen.dart';

class PostWriteNavigation extends StatelessWidget {
  const PostWriteNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
              color: WaiColors.white70,
              width: 0.5
          ),
        )
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.change_circle_rounded, color: WaiColors.white70, size: 30,),
            onPressed: () {
              PostWriteController.to.changeBackgroundImage();
            },
          )
          /*IconButton(
            icon: const Icon(Icons.visibility_rounded, color: WaiColors.white70,),
            onPressed: () {
              Get.to(() => ImageSelectScreen());
            },
          )*/
        ],
      ),
    );
  }
}
