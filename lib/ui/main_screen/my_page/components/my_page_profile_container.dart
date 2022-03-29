import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/image_container.dart';
import 'package:wai/constants/constants.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_tab_bar.dart';

class MyPageProfileContainer extends StatelessWidget {
  const MyPageProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
          color: Colors.transparent,  // WaiColors.profileBackground,
          // gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [
          //       WaiColors.deepLightBlueGrey,
          //       WaiColors.lightBlueGrey
          //     ]
          // )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Blank(height: 50,),
          Obx(() =>
            Column(
              children: [
                Center(
                  child: MyPageImage(profileImageFileId: UserController.to.user.value.profileImageFileId),
                ),
                const Blank(height: 5,),
                Text(UserController.to.user.value.nickname!, style: const TextStyle(color: WaiColors.white))
              ],
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // decoration: const BoxDecoration(
            //     border: Border(
            //         top: BorderSide(width: 0.5, color: WaiColors.white)
            //     )
            // ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: MyPageTabBar(),
            ),
          )
        ],
      ),
    );
  }
}

class MyPageImage extends StatelessWidget {
  const MyPageImage({Key? key, this.profileImageFileId}) : super(key: key);
  final int? profileImageFileId;

  @override
  Widget build(BuildContext context) {
    if (profileImageFileId == null) {
      return const Icon(
        Icons.account_circle,
        size: 80,
        color: WaiColors.white,
      );

    } else {
      /*return CachedNetworkImage(
        width: 80,
        height: 80,
        imageUrl: '$baseUrl/api/fileUpLoad/image/$profileImageFileId',
      );*/

      return ImageContainer(
          borderRadius: 40,
          width: 80,
          height: 80,
          imageUrl: '$baseUrl/api/fileUpLoad/image/$profileImageFileId',
      );
    }
    return Container();
  }
}

