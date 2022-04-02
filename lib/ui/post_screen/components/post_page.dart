import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/common/widgets/wai_popup_menu_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/post/post_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/ui/post_screen/components/post_bottom_container.dart';
import 'package:wai/ui/post_screen/components/post_layout.dart';

class PostPage extends GetView<PostController> {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (PostController.to.post.value.isDeleted!) {
        Get.back(result: PostController.to.post.value);
        WaiDialog.notify('알림', '이미 삭제된 글입니다.');
      } else if (PostController.to.post.value.isReported!) {
        Get.back(result: PostController.to.post.value);
        WaiDialog.notify('알림', '신고되어 블라인드된 글입니다.');
      }
    });

    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: WaiAppbar(
              title: const Text('글', style: TextStyle(color: WaiColors.white70),),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: InkWell(
                child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: WaiColors.white70),
                onTap: () {
                  Get.back(result: PostController.to.post.value);
                },
              ),
              actions: [
                waiPopupMenuButton(),
                const Blank(width: 10)
              ],
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(PostController.to.post.value.backgroundImageName ?? 'assets/images/post_background_image/1.jpg'),
                    opacity: 0.8,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(WaiColors.black70.withOpacity(0.6), BlendMode.color),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Blank(height: 50),
                  HorizontalBorderLine(height: 0.5, color: WaiColors.white70,),
                  Expanded(
                    child: PostLayout()
                  ),
                  PostBottomContainer(),
                ],
              ),
            )
        )
    );
  }

  WaiPopupMenuButton waiPopupMenuButton() {
    if (PostController.to.post.value.userId == UserController.to.user.value.userId) {
      return WaiPopupMenuButton(
        valueList: const ['수정하기', '삭제하기'],
        callBackList: [PostController.to.clickUpdate, PostController.to.clickDelete],
      );

    } else {
      return WaiPopupMenuButton(
        valueList: const ['신고하기','사용자 차단하기'],
        callBackList: [PostController.to.clickReport, PostController.to.clickBanUser],
      );
    }
  }
}
