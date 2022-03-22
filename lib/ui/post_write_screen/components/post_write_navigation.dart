import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/ui/post_write_screen/image_select_screen/image_select_screen.dart';

class PostWriteNavigation extends StatelessWidget {
  const PostWriteNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      /*decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: WaiColors.white70,
                        width: 0.5
                    ),
                    bottom: BorderSide(
                      color: WaiColors.white70,
                      width: 0.5
                    )
                  )
                ),*/
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.visibility_rounded, color: WaiColors.white70,),
            onPressed: () {
              Get.to(() => ImageSelectScreen());
            },
          )
        ],
      ),
    );
  }
}
