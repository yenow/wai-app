
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/screens/reply_page/reply_page_screen.dart';
import 'package:wai/common/utils/date_util.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';

import '../post_page_screen.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key, required this.post}): super(key: key);
  final Post post;

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  late Post post;

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () async {
        SchedulerBinding.instance!.addPostFrameCallback((_) async {
          Post returnPost = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => PostPageScreen(postId: post.postId!)),
          );
          setState(() {
            post = returnPost;
          });
        });
      },
      child: _buildBody(context),
    );
  }

  Container _buildBody(BuildContext context) {
    if (post.isDeleted!) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(context),
                _buildInformation(context),
              ],
            ),
          ),
          _buildReplyArea()
        ],
      ),
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(post.title!,
              style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.black54)),
        ],
      ),
    );
  }

  Padding _buildInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: SizedBox(
        // height: 30,
        child: Row(
          children: [
            _buildAuthor(context),
            const Blank(width: 8,),
            _buildDateTime(),
            const Blank(width: 8,),
            _buildCount(),
            const Blank(width: 8,),
            _buildLikeCount()
          ],
        ),
      ),
    );
  }

  Row _buildAuthor(BuildContext context) {
    String author = post.author ?? "익명";

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(image: AssetImage(EnneagramController.to.enneagram![post.authorEnneagramType ?? 1]!.imagePath), width: 17, height: 17,  fit: BoxFit.fill,),
        const Blank(width: 5,),
        Text(author, style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
      ],
    );
  }

  Text _buildDateTime() {

    return Text(dateTimeToString(AppController.to.nowServerTime.value ,post.updateDate!), style: CustomTextStyles.buildTextStyle(fontSize: 14, color: Colors.black45));
  }

  Row _buildCount() {
    int clickCount = post.clickCount!;

    return Row(
      children: [
        const Icon(Icons.visibility_outlined, size: 15, color: Colors.black45 ),
        const Blank(width: 2),
        Text("$clickCount", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
      ],
    );
  }

  Row _buildLikeCount() {
    int likeyCount = post.likeyCount!;

    return Row(
      children: [
        const Icon(Icons.favorite_border_outlined, size: 15, color: Colors.black45 ),
        const Blank(width: 2,),
        Text("$likeyCount", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
      ],
    );
  }

  Container _buildReplyArea() {
    int replyLength = post.replys!.length;

    return Container(
        width: 40,
        height: 60,
        child: TextButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$replyLength", style: CustomTextStyles.buildTextStyle(fontSize: 13, color: Colors.black54),),
              Text('댓글', style: CustomTextStyles.buildTextStyle(fontSize: 13, color: Colors.black54),),
              // const Icon(FontAwesomeIcons.commentDots, size: 15, color: Colors.black54 )
            ],
          ),
          onPressed: () async {
            Post returnPost = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReplyPageScreen(postId: post.postId!)),
            );

            setState(() {
              post = returnPost;
            });
          },
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.shade200,
        )
    );
  }
}
