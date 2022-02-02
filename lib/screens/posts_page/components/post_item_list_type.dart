
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/components/image_container.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_loginpage_textstyle.dart';
import 'package:wai/common/theme/custom_postpage_textstyle.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/common/theme/theme.dart';
import 'package:wai/sample/understand_constraint.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/widgets/black.dart';

class PostItemListType extends StatelessWidget {
  final Post post;
  final GestureTapCallback? onTap;

  const PostItemListType({Key? key, required this.post, required this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            // Text('별명', style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
            const Blank(width: 8,),
            Text("14:24", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
            const Blank(width: 8,),
            Row(
              children: [
                const Icon(Icons.visibility_outlined, size: 15, color: Colors.black45 ),
                const Blank(width: 2,),
                Text("14", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
              ],
            ),
            const Blank(width: 8,),
            Row(
              children: [
                const Icon(Icons.favorite_border_outlined, size: 15, color: Colors.black45 ),
                const Blank(width: 2,),
                Text("14", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
              ],
            )
            // const Padding(
            //   padding: EdgeInsets.fromLTRB(2.0,0,0,0),
            //   child: Image(image: AssetImage('assets/images/enneagram/cat.png'), width: 15, height: 15,  fit: BoxFit.fill,),
            // ),
            // _buildEnneagramType(context),
          ],
        ),
      ),
    );
  }

  Container _buildReplyArea() {
    return Container(
        child: SizedBox(
          width: 40,
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('1', style: CustomTextStyles.buildTextStyle(fontSize: 13, color: Colors.black54),),
              Text('댓글', style: CustomTextStyles.buildTextStyle(fontSize: 13, color: Colors.black54),),
              // const Icon(FontAwesomeIcons.commentDots, size: 15, color: Colors.black54 )
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey.shade200,
        )
    );
  }

  Row _buildAuthor(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(image: AssetImage('assets/images/enneagram/cat.png'), width: 15, height: 15,  fit: BoxFit.fill,),
        const Blank(width: 2,),
        Text('별명', style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
      ],
    );
  }
}