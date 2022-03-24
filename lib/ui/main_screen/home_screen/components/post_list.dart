import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_likey_icon.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_reply_icon.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_view_icon.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: InkWell(
          onTap: () async {
            var response = await Get.toNamed('${WaiRoutes.post}/${post.postId}', arguments: post);
            logger.d(response);
          },
          child: Container(
            height: 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PostViewIcon(clickCount: 1, size: 17,),
                    const Blank(width: 20,),
                    PostLikeyIcon(likeyCount: 1, size: 17),
                    const Blank(width: 20,),
                    PostReplyIcon(replyCount: 1, size: 17),
                  ],
                ),
                AutoSizeText(post.title!, style: const TextStyle(fontSize: 22, color: WaiColors.white70), maxLines: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('${post.enneagramType!}유형', style: const TextStyle(fontSize: 15, color: WaiColors.white70)),
                    // const Blank(width: 10,),
                    // Image(
                    //   image: AssetImage(EnneagramController.to.enneagram[post.enneagramType!]!.imagePath),
                    //   width: 15,
                    //   height: 15,
                    //   fit: BoxFit.fill,
                    // ),
                    // const Blank(width: 5),
                    Text('${post.author!} [${post.authorEnneagramType!}유형]', style: const TextStyle(fontSize: 17, color: WaiColors.white70)),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              // color: WaiColors.deepLightMainColor,
              image: DecorationImage(
                image: AssetImage("assets/images/background/${rng.nextInt(3) + 1}.jpg"),
                opacity: 0.9,
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
              )
            )
          ),
        ),
      ),
    );
  }
}
