import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/widgets/custom_appbar.dart';

class PostPageScreen extends StatelessWidget {
  final int postId;
  Post? post;

  PostPageScreen({required this.postId});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Post?>(
      future: PostController.to.readPost(postId),
      builder: (context, snapshot) {

        switch(snapshot.connectionState) {
          case ConnectionState.waiting :
            return const CircularProgressIndicator();
          default :
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              post = snapshot.data;
              return _buildScaffold(context);
            }
        }
      });
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
        child: AppBar(
          title: Text("게시글"),
          elevation: 2.0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.blueGrey,),
            onTap: () {
              MainController.to.back();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildBlank(),
                _title(),
                _postInfomation(),
                _horizontalBorderLine(),
                _content(),
                _horizontalBorderLine(),
                _secondPostInfomation(),
                _horizontalBorderLine(),
                _buildReplyList(context: context),
              ]
            ),
          ),
          _buildReplyInputArea()
        ],
      )
    );
  }

  SizedBox _buildBlank({double height = 10, double width = 10}) => SizedBox(height: height, width: width);

  Widget _title() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Text(post!.title!, style : CustomTextStyles.postTitleStyle()),
    );
  }

  Widget _postInfomation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Color.fromRGBO(150, 150, 150, 0.3)
            ),
            child: Text('1유형', style: CustomTextStyles.buildTextStyle(fontSize: 14, color: Colors.grey))
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(post!.content!, style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.black54),)
    );
  }

  Widget _secondPostInfomation() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(FontAwesomeIcons.heart, size: 18, color: Colors.black54,),
                Text('1', style: CustomTextStyles.buildTextStyle(fontSize: 18, color:Colors.black54),)
              ],
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(FontAwesomeIcons.commentDots, size: 18, color: Colors.black54,),
                Text('1', style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.black54),)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _horizontalBorderLine({double height = 0.5}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: PreferredSize(
          child: Divider(thickness: 0.5, height: height, color: bodyBorderColor),
          preferredSize: const Size.fromHeight(0.5)
      ),
    );
  }

  Widget _buildReplyList({required BuildContext context}) {

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return _buildReply();
      },
      separatorBuilder: (BuildContext context, int index) {
        return _horizontalBorderLine();
      },
    );
  }

  Column _buildReply() {
    return Column(
        children: [
          _buildReplyInfomation(),
          _buildReplyContent()
        ],
      );
  }

  Padding _buildReplyContent() {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: _replyContent(),
        );
  }

  Padding _buildReplyInfomation() {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Color.fromRGBO(150, 150, 150, 0.3)
                  ),
                  child: Text('1유형', style: CustomTextStyles.buildTextStyle(fontSize: 14, color: Colors.grey))
              ),
              _buildBlank(),
              Text('익명1', style: CustomTextStyles.buildTextStyle(fontSize: 14, color: Colors.grey)),
              _buildBlank(),
              Text('6시간 전', style: CustomTextStyles.buildTextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),
        );
  }

  Widget _replyContent() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text("댓글입니다.", style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black54),)
    );
  }


  Widget _buildReplyInputArea() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
          // color: Colors.grey.shade200,
        border: BorderDirectional(
          top: BorderSide(width: 2, color: Colors.grey.shade400)
        )
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(FontAwesomeIcons.commentDots, size: 20, color: Colors.grey),
          ),
          Expanded(child: _buildReplyInput()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(FontAwesomeIcons.reply, size: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyInput() {

    return GestureDetector(

      child: TextField(
          cursorColor: Colors.grey,
          maxLength: 4000,
          maxLines: 100,
          style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey),
          decoration: InputDecoration(
            labelText: "댓글을 입력해주세요.",
            labelStyle: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.white,
            filled: true,
            enabledBorder: const UnderlineInputBorder (
              borderSide: BorderSide(width: 0.5, color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.grey),
            ),
            counterText:'',
            // prefixIcon: prefixIcon,
            // focusColor: Colors.grey,
          )
      ),
    );
  }
}
