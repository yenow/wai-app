import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_likey_icon.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_reply_icon.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_view_icon.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key, required this.post, required this.posts}) : super(key: key);
  final List<Post> posts;
  final Post post;

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    if (post.isDeleted! || post.isReported!) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: InkWell(
          onTap: () async {
            var response = await Get.toNamed('${WaiRoutes.post}/${post.postId}');
            if (response is Post) {
              int index = posts.indexWhere((element) => element.postId == response.postId);
              posts[index] = response;
            }
          },
          child: Container(
            height: 160,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PostViewIcon(clickCount: post.clickCount!, size: 17,),
                      const Blank(width: 20,),
                      PostLikeyIcon(likeyCount: post.likeyCount!, size: 17, isLikey: true),
                      const Blank(width: 20,),
                      PostReplyIcon(replyCount: post.replyCount!, size: 17),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(child: AutoSizeText(post.title!, style: const TextStyle(fontSize: 22, color: WaiColors.white70), maxLines: 2))
                ),
                AutoSizeText(post.tagString!, style: const TextStyle(fontSize: 16, color: WaiColors.white70), maxLines: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(post.author!, style: const TextStyle(fontSize: 17, color: WaiColors.white70)),
                    //     const Blank(width:10,),
                    //     Text('${post.authorEnneagramType!}유형', style: const TextStyle(fontSize: 17, color: WaiColors.white70)),
                    //   ],
                    // ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Icon(
                        Icons.account_circle,
                        size: 20,
                        color: WaiColors.white70,
                      ),
                    ),
                    const Blank(width: 5,),
                    Text('${post.author!} [${post.authorEnneagramType!}유형]', style: const TextStyle(fontSize: 17, color: WaiColors.white70)),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              // color: WaiColors.deepLightMainColor,
              image: DecorationImage(
                image: AssetImage(post.backgroundImageName ?? 'assets/images/post_background_image/1.jpg'),
                opacity: 0.9,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
              )
            )
          ),
        ),
      ),
    );
  }
}
