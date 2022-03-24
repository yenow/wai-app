import 'package:flutter/material.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/data/model/post/post.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_likey_icon.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_reply_icon.dart';
import 'package:wai/ui/main_screen/home_screen/components/post_view_icon.dart';

class PostBottomContainer extends StatelessWidget {
  const PostBottomContainer({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              PostViewIcon(clickCount: post.clickCount!, size: 25, intervalSize: 8,)
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 80,
                child: WaiButton(
                    backgroundColor: Colors.transparent,
                    child: Row(
                      children: [
                        PostLikeyIcon(likeyCount: post.likeyCount!, size: 25, intervalSize: 8,)
                      ],
                    ),
                    onPressed: () {}
                ),
              ),
              SizedBox(
                height: 50,
                width: 80,
                child: WaiButton(
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      PostReplyIcon(replyCount: post.replyCount!, size: 25, intervalSize: 8,)
                    ],
                  ),
                  onPressed: () {}
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
