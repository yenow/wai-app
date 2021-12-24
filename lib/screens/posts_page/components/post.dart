
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wai/common/components/image_container.dart';
import 'package:wai/constants.dart';
import 'package:wai/theme.dart';

const double verticalPaddingValue = 8.0;
const double horizontalPaddingValue = 8.0;

const double topValue = 4.0;
const double leftValue = 4.0;
const double rightValue = 4.0;
const double bottomValue = 4.0;

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: bodyContainerColor,
        border: Border(
          bottom: BorderSide(width: 0.5, color: bodyBorderColor)
        )
      ),
      child: Column(
        children: [
          _buildTitle(),
          _buildWriter(),
          const PreferredSize(
              child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
              preferredSize: Size.fromHeight(0.5)
          ),
          _buildContent(),
          _buildImage(),
          const PreferredSize(
              child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
              preferredSize: Size.fromHeight(0.5)
          ),
          _buildTail(),
        ],
      ),
    );
  }

  Padding _buildTitle() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('제목입니다',
                    style: textTheme().headline1,),
                ],
              ),
              const Icon(FontAwesomeIcons.alignLeft,
                size: bodyText2Value,
                color: bodyTextColor)
            ],
          ),
          height: 30,
        ),
    );
  }

  Padding _buildWriter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                child: Text('1유형', style: const TextTheme().bodyText2,),
              ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(2.0,0,0,0),
                  child: Image(image: AssetImage('assets/images/enneagram/cat.png'), width: 18, height: 18,  fit: BoxFit.fill,),
                ),],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const ImageContainer(
                  borderRadius: 15,
                  imageUrl: 'https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927',
                  width: 20,
                  height: 20,),
                Text.rich(
                  TextSpan(text: '띠용',style: textTheme().bodyText1),
                )
              ],
            )
          ],
        ),
        height: 30,
      ),
    );
  }

  Padding _buildContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(leftValue,topValue,rightValue,bottomValue),
      child: Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '내용입니다.',
            style: textTheme().bodyText2,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ) ,
        height: 50,
      ),
    );
  }

  Visibility _buildImage() {
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

  Padding _buildTail() {
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
                  style: textTheme().bodyText2,
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
                  style: textTheme().bodyText2,
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