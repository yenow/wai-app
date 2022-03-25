import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_popup_menu_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/model/post/post.dart';

import '../../../controller/post/post_controller.dart';

class PostLayout extends StatelessWidget {
  const PostLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: AutoSizeText(
                PostController.to.post.value.title!,
                style: const TextStyle(fontSize: 30, color: WaiColors.white80),
                maxLines: 2,
              )
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 25,
                    color: WaiColors.white70,
                  ),
                  const Blank(width: 5,),
                  Text('${PostController.to.post.value.author!} [${PostController.to.post.value.authorEnneagramType!}유형]', style: const TextStyle(fontSize: 18, color: WaiColors.white60)),
                ],
              ),
            ),
            // const HorizontalBorderLine(height: 0.5, color: WaiColors.white70),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(child: Text(PostController.to.post.value.content!, style: const TextStyle(fontSize: 22, color: WaiColors.white80))),
              )
            ),
          ],
        ),
      ),
    );
  }


}
