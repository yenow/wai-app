import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/post/post_write_controller.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/ui/post_write_screen/components/post_write_input_tag.dart';
import 'package:wai/ui/post_write_screen/components/post_write_input_title.dart';
import 'package:wai/ui/post_write_screen/components/post_write_navigation.dart';

import '../../common/utils/logger.dart';
import 'components/post_write_input_content.dart';

class PostWriteScreen extends GetView<PostWriteController> {
  const PostWriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post? post = Get.arguments;
    logger.d(post);
    if (post != null) {
      controller.setPostSaveRequestDto(post);
    }

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: WaiAppbar(
          title: const Text('글쓰기', style: TextStyle(color: WaiColors.white70),),
          borderColor: WaiColors.white70,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            MyPageActionButton(onPressed: controller.savePost)
          ],
          leading: InkWell(
            child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: WaiColors.white70),
            onTap: () {
              Get.back();
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background/moon.jpg"),
                opacity: 0.8,
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(WaiColors.black70.withOpacity(0.6), BlendMode.color),
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Blank(height: 50),
              // PostWriteNavigation(),
              PostWriteInputTitle(),
              PostWriteInputTag(),
              Expanded(
                child: PostWriteInputContent()
              ),
              Blank(height: 50),
            ],
          ),
        )
      )
    );
  }
}

class MyPageActionButton extends StatelessWidget {
  const MyPageActionButton({Key? key, this.onPressed}) : super(key: key);
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: const Icon(
          Icons.edit_rounded,
          color: WaiColors.white70,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
