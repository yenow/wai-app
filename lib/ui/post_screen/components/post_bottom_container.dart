import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/post/post_controller.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_likey_icon.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_reply_icon.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_view_icon.dart';

class PostBottomContainer extends GetView<PostController> {
  const PostBottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Container(
        height: 60,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: WaiColors.white70,
                    width: 0.5
                )
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: PostViewIcon(clickCount: controller.post.value.clickCount!, size: 25, intervalSize: 8,),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    width: 80,
                    child: WaiButton(
                        backgroundColor: Colors.transparent,
                        child: PostLikeyIcon(likeyCount: controller.post.value.likeyCount!, size: 25, intervalSize: 8, isLikey: controller.post.value.isLikey!,),
                        onPressed: PostController.to.clickLikey
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 80,
                    child: WaiButton(
                      backgroundColor: Colors.transparent,
                      child: PostReplyIcon(replyCount: controller.post.value.replyCount!, size: 25, intervalSize: 8,),
                      onPressed: PostController.to.goReplyPage
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
