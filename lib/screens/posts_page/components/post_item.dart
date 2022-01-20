
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
import 'package:wai/models/post.dart';
import 'package:wai/common/theme/theme.dart';
import 'package:wai/sample/understand_constraint.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';

const double verticalPaddingValue = 8.0;
const double horizontalPaddingValue = 8.0;

const double topValue = 4.0;
const double leftValue = 4.0;
const double rightValue = 4.0;
const double bottomValue = 4.0;

class PostItem extends StatelessWidget {
  final Post post;
  final GestureTapCallback? onTap;

  PostItem({required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2.0,
            ),
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(context),
            _buildInformation(context),
            _horizontalBorderLine(),
            _buildContent(context),
            /*_buildImage(context),*/
            /*_horizontalBorderLine(),*/
            /*_buildTail(context),*/
          ],
        ),
      ),
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(post.title,
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
    );
  }

  Padding _buildInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* 유형표시 ex) 1유형 */
            _buildEnneagramType(context),
          ],
        ),
        height: 30,
      ),
    );
  }

  Row _buildEnneagramType(BuildContext context) {
    return Row(
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
    );
  }

  Padding _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
      child: Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            post.content,
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

  Widget _buildIconAndNumberText({required Icon icon, required int numberText}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          icon,
          SizedBox(width: 5,),
          Text.rich(
            TextSpan(
              text: numberText.toString(),
              style: CustomTextStyles.buildTextStyle(fontSize : 20, color: bodyTextColor)
            ),
          ),
          // Text(numberText.toString(), style: CustomTextStyles.buildTextStyle(fontSize : 18, color: bodyTextColor)),
        ],
      ),
    );
  }

  PreferredSize _horizontalBorderLine() {
    return const PreferredSize(
        child: Divider(thickness: 0.5, height: 0.25, color: bodyBorderColor),
        preferredSize: Size.fromHeight(0.5)
    );
  }
}