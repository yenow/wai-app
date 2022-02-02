import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/constants/custom_colors.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/utils/logger.dart';
import 'package:wai/widgets/black.dart';
import 'package:wai/widgets/block_text.dart';
import 'package:wai/widgets/custom_appbar.dart';
import 'package:wai/widgets/horizontal_border_line.dart';

class PostPageScreen extends StatelessWidget {
  final int postId;
  Post? post;

  PostPageScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    loggerNoStack.d("build PostPageScreen");

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

  Widget _buildScaffold(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
          child: AppBar(
            title: Text("게시글", style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.white),),
            // elevation: 2.0,
            backgroundColor: lightBlueGrey,   // Colors.white
            leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.white,),
              onTap: () {
                Get.back();
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
                  const Blank(height: 10,),
                  _buildtitle(),
                  _buildInformation(),
                  const Blank(height: 10,),
                  const HorizontalBorderLine(),
                  _buildContent(),
                  const HorizontalBorderLine(),
                  const Blank(height: 5),
                  _buildReplyTop(),
                  // const HorizontalBorderLine(),
                  const Blank(height: 10,),
                  _buildReplyList(context: context),
                  const HorizontalBorderLine(),
                  SizedBox(
                    height: 50,
                    child: TextButton.icon(
                      icon: Icon(FontAwesomeIcons.commentDots, size: 20, color: Colors.grey,),
                      label: Text("댓글을 남겨보세요.",
                        style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      // child: Text("댓글을 남겨보세요.",
                      //   style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.grey),
                      // ),
                      onPressed: () {

                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal:10),
                        alignment: Alignment.centerLeft
                      ),
                    ),
                  )
                ]
              ),
            ),
            _buildReplyInputArea()
          ],
        )
      ),
    );
  }

  Padding _buildInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image(image: AssetImage('assets/images/enneagram/cat.png'), width: 26, height: 26,  fit: BoxFit.fill,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAuthor(),
                _buildPostInfomation(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildtitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Text(post!.title!, style : CustomTextStyles.postTitleStyle(color: Colors.black87)),
    );
  }

  Widget _buildAuthor() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text('별명입니다', style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
          const Blank(width: 10,),
          BlockText(text: "1유형"),
        ],
      )
    );
  }

  Widget _buildPostInfomation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        children: [
          Text("2021-02-02 14:24", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
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
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Text(post!.content!, style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.black54),)
    );
  }

  Widget _buildReplyTop() {
    return SizedBox(
      height: 40,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Blank(width: 10),
            Text('댓글', style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.black54)),
            const Blank(width: 10),
            Text('1', style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.black54)),
            const Blank(width: 10),
            Icon(Icons.arrow_forward_ios_outlined, size: 18, color: Colors.black54,),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyList({required BuildContext context}) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return _buildReply();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalBorderLine();
        },
      ),
    );
  }

  Column _buildReply() {
    return Column(
      children: [
        const Blank(height: 10,),
        _buildReplyInfomation(),
        _replyContent(),
        Row(
          children: [
            const Blank(width: 20,),
            SizedBox(
              height: 20,
              child: Center(child: Text('6시간 전', style: CustomTextStyles.buildTextStyle(fontSize: 12, color: Colors.grey)))
            ),
            const Blank(width: 10,),
            Text("답글쓰기", style: CustomTextStyles.buildTextStyle(fontSize: 12, color: Colors.grey),)
          ],
        ),
        const Blank(height: 10,),
      ],
    );
  }

  // Padding _buildReplyContent() {
  //   return _replyContent();
  // }

  Row _buildReplyInfomation() {
    return Row(
      children: [
        // const Blank(width: 10,),
        Image(image: AssetImage('assets/images/enneagram/cat.png'), width: 18, height: 18,  fit: BoxFit.fill,),
        const Blank(width: 5,),
        Text('별명입니다', style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
        const Blank(width: 10,),
        BlockText(text: "1유형"),
      ],
    );
  }

  // Widget _buildReplyAuthor() {
  //   return Container(
  //       padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  //       alignment: Alignment.centerLeft,
  //       child: Row(
  //         children: [
  //           Text('별명입니다', style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
  //           const Blank(width: 10,),
  //           BlockText(text: "1유형"),
  //         ],
  //       )
  //   );
  // }

  Widget _replyContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Blank(width: 20,),
          Text("댓글입니다.", style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black54),),
        ],
      ),
    );
  }


  Widget _buildReplyInputArea() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          // color: Colors.grey.shade200,
        border: BorderDirectional(
          top: BorderSide(width: 0.5,  color: Colors.grey.shade400)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Icon(Icons.reorder_outlined, size: 18, color: Colors.black45 ),
                const Blank(width: 2,),
                Text("목록", style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black45)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.favorite_border_outlined, size: 18, color: Colors.black45 ),
                const Blank(width: 5),
                Text("7", style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black45)),
                const Blank(width: 10),
                const Icon(FontAwesomeIcons.commentDots, size: 18, color: Colors.black45 ),
                const Blank(width: 5),
                Text("7", style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black45)),
              ],
            ),
          ),
          /*
          Expanded(child: _buildReplyInput()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(FontAwesomeIcons.reply, size: 20, color: Colors.grey),
          ),
          */
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
