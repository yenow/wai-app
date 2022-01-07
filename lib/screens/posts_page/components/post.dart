
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
import 'package:wai/models/post_item.dart';
import 'package:wai/common/theme/theme.dart';
import 'package:wai/sample/understand_constraint.dart';
import 'package:wai/screens/posts_page/components/post_page_screen.dart';

const double verticalPaddingValue = 8.0;
const double horizontalPaddingValue = 8.0;

const double topValue = 4.0;
const double leftValue = 4.0;
const double rightValue = 4.0;
const double bottomValue = 4.0;

class Post extends StatelessWidget {
  final PostItem postItem;
  final Function onTap;

  Post({required this.postItem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              // top: BorderSide(width: 0.5, color: Colors.grey),
              bottom: BorderSide(width: 0.5, color: Colors.grey)
          ),
          color: Colors.white,
      ),
      // margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(context),
          _buildWriter(context),
          const PreferredSize(
              child: Divider(thickness: 0.5, height: 0.25, color: bodyBorderColor),
              preferredSize: Size.fromHeight(0.5)
          ),
          _buildContent(context),
          _buildImage(context),
          const PreferredSize(
              child: Divider(thickness: 0.5, height: 0.25, color: bodyBorderColor),
              preferredSize: Size.fromHeight(0.5)
          ),
          _buildTail(context),
        ],
      ),
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
        child: InkWell(
          onTap: () {
            onTap();
            MainController.to.setIsPostPageOpen(true);
          },
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(postItem.title,
                      style: Theme.of(context).textTheme.postTitleText),
                  ],
                ),
                const Icon(FontAwesomeIcons.alignLeft,
                  size: bodyText2Size,
                  color: bodyTextColor)
              ],
            ),
            height: 30,
          ),
        ),
    );
  }

  Padding _buildWriter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* 유형표시 ex) 1유형 */
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Color.fromRGBO(150, 150, 150, 0.3)
                ),
                child: Text('1유형', style: Theme.of(context).textTheme.postPosonalityTypeText),
              ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(2.0,0,0,0),
                  child: Image(image: AssetImage('assets/images/enneagram/cat.png'), width: 18, height: 18,  fit: BoxFit.fill,),
                ),],
            ),
            /* 작성자 프로필 */
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const ImageContainer(
                  borderRadius: 15,
                  imageUrl: 'https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927',
                  width: 16,
                  height: 16,
                ),
                SizedBox(width: 3,),
                Text.rich(
                  TextSpan(
                      text: postItem.nickname ,
                      style: Theme.of(context).textTheme.postNicknameText
                  ),
                )
              ],
            )
          ],
        ),
        height: 30,
      ),
    );
  }

  Padding _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
      child: Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            postItem.content,
            style: Theme.of(context).textTheme.postContentText,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ) ,
        height: 50,
      ),
    );
  }

  Visibility _buildImage(BuildContext context) {
    return const Visibility(
        visible: true,
        child: Padding(
          padding: EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
          child: Image(image: AssetImage('assets/images/pic1.jpg'),
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,)
        ),
      );
  }

  Padding _buildTail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.smile,
                  color: bodyTextColor,
                  size: 22,
                ),
                SizedBox(width: 8),
                Text('공감하기',
                  style: Theme.of(context).textTheme.postPlainText,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.commentAlt,
                  color: bodyTextColor,
                  size: 22,
                ),
                SizedBox(width: 8),
                Text('댓글쓰기',
                  style: Theme.of(context).textTheme.postPlainText,
                ),
              ],
            ),
          ],
        ),
        height: 30,
      ),
    );
  }
}