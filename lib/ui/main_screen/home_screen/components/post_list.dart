import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/data/model/post/post.dart';
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
        child: Container(
          height: 150,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PostViewIcon(clickCount: 1,),
                  const Blank(width: 10,),
                  PostLikeyIcon(likeyCount: 1,),
                  const Blank(width: 10,),
                  PostReplyIcon(replyCount: 1,),
                ],
              ),
              AutoSizeText(post.title!, style: const TextStyle(fontSize: 20, color: WaiColors.white70), maxLines: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${post.enneagramType!}유형', style: const TextStyle(fontSize: 15, color: WaiColors.white70)),
                  const Blank(width: 10,),
                  Text(post.nickname!, style: const TextStyle(fontSize: 15, color: WaiColors.white70)),
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
    );
  }
}
