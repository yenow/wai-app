import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/constants/wai_textstyle.dart';
import 'package:wai/route.dart';

class MainBottomSheet extends StatelessWidget {
  const MainBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
      child: Container(
        height: 180,
        color: Colors.white,
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            const MainBottomSheetHeader(),
            const Blank(height: 10,),
            MainBottomSheetListItem(
              title: '글쓰기',
              icon: const Icon(Icons.post_add_rounded, size: 20, color: WaiColors.lightMainColor),
              onTap: () {
                Get.back();
                Get.toNamed(WaiRoutes.postWrite);
              },
            ),
            MainBottomSheetListItem(
              title: '에니어그램 테스트하기',
              icon: const Icon(Icons.checklist_rounded, size: 20, color: WaiColors.lightMainColor),
              onTap: () {
                Get.back();
                Get.toNamed(WaiRoutes.hardTest);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MainBottomSheetHeader extends StatelessWidget {
  const MainBottomSheetHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('만들기', style: TextStyle(fontSize: 20, color: WaiColors.black60)),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }
}

class MainBottomSheetListItem extends StatelessWidget {
  const MainBottomSheetListItem({Key? key, required this.icon, required this.title, this.onTap}) : super(key: key);
  final Icon icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            // Icon(Icons.post_add_rounded, size: 17, color: Colors.black54),
            icon,
            const Blank(width: 10),
            Text(title, style: const TextStyle(fontSize: 17, color: WaiColors.lightMainColor))
          ],
        ),
      ),
      onTap: onTap,
    );
  }

}

