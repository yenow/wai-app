import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/common/widgets/wai_popup_menu_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permernent/user_controller.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/ui/post_screen/components/post_bottom_container.dart';
import 'package:wai/ui/post_screen/components/post_layout.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
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
                  Get.back();
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
                    image: AssetImage("assets/images/background/moon.jpg"),
                    opacity: 0.8,
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(WaiColors.black70.withOpacity(0.6), BlendMode.color),
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Blank(height: 50),
                  const HorizontalBorderLine(height: 0.5, color: WaiColors.white70,),
                  Expanded(
                    child: PostLayout(post: post)
                  ),
                  PostBottomContainer(post: post),
                ],
              ),
            )
        )
    );
  }

  WaiPopupMenuButton waiPopupMenuButton() {
    return post.userId == UserController.to.user.value.userId
        ? WaiPopupMenuButton(
      valueList: const ['수정하기', '삭제하기'],
      callBackList: [() {}, () {}, () {}],
    ) :WaiPopupMenuButton(
      valueList: const ['신고하기'],
      callBackList: [() {}],
    );
  }
}
