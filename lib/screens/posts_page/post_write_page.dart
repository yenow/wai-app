import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/utils/function.dart';
import 'package:wai/widgets/wai_dialog.dart';

class PostWritePage extends StatelessWidget {
  const PostWritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        appBar: _buildAppbar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInputTitle(),
            _buildInputContent(),
            _buildTail()
          ],
        ),
      ),
    );
  }

  PreferredSize _buildAppbar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(MainController.to.appBarState.value.appbarSize),
        child: AppBar(
          title: Text("게시글 작성"),
          elevation: 2.0,
          backgroundColor: Colors.white,
          leading: _buildAppbarLeading(context),    // 뒤로가기 아이콘
          actions: [
            _buildAppbarActions(context)    // 게시글 등록 아이콘
          ],
        ),
      );
  }

  GestureDetector _buildAppbarLeading(BuildContext context) {
    return GestureDetector(
          child: Icon(FontAwesomeIcons.chevronLeft, size: 20, color: Colors.blueGrey,),
          onTap: () {

            WaiDialog.showConfirmMessage(
                context: context,
                content: "게시글 작성중입니다. 뒤로 가시겠습니까?",
                confirmOnPress: () {
                  MainController.to.back();
                }
            );
          },
        );
  }

  Widget _buildAppbarActions(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: GestureDetector(
        onTap: () async {
          PostController.to.writingPost.value.userId = AppController.to.userId.value!;
          PostController.to.writingPost.value.userKey = AppController.to.userKey.value!;

          // check Value
          if (checkValue(context: context)) {

            // api request
            Map<String, dynamic> jsonMap = PostController.to.writingPost.value.toJson();
            var responseBody = await postRequest("/api/savePost", json.encode(jsonMap));
            Post post = Post.fromJson(json.decode(responseBody));

            // message
            WaiDialog.showMessage(
              context: context,
              content: "게시글이 등록되었습니다",
            );

            // todo, posts add
            // PostController.to.posts.value.insert(0, element);
            PostController.to.removeWritingPost();
            MainController.to.back();
          }
        },
        child: Icon(FontAwesomeIcons.checkCircle, size: 25, color: Colors.blueGrey,),
      ),
    );
  }

  Widget _buildInputTitle() {
    return Container(
      child: TextField(
          cursorColor: Colors.grey,
          maxLength: 100,
          maxLines: 1,
          style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.grey),
          controller: TextEditingController(
            text: PostController.to.writingPost.value.title
          ),
          onChanged: (String title) {
            PostController.to.setWritingPostTitle(title);
          },
          decoration: InputDecoration(
            labelText: "제목을 입력해주세요.",
            labelStyle: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            fillColor: Colors.white,
            filled: true,
            enabledBorder: UnderlineInputBorder (
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            counterText:'',
            // prefixIcon: prefixIcon,
            // focusColor: Colors.grey,
          )
      ),
    );
  }

  Flexible _buildInputContent() {
    return Flexible(
        flex: 7,
        child: Container(
          child: TextField(
            cursorColor: Colors.grey,
            maxLength: 4000,
            maxLines: 100,
            textAlign: TextAlign.justify,
            style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey),
            controller: TextEditingController(
                text: PostController.to.writingPost.value.content
            ),
            onChanged: (String content) {
              PostController.to.setWritingPostContent(content);
            },
            decoration: InputDecoration(
              labelText: "이야기를 적어주세요.",
              labelStyle: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey),
              //label: Text("이야기를 적어주세요", style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey)),
              counterText:'',
              fillColor: Colors.white,
              filled: true,
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              enabledBorder: UnderlineInputBorder (
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),

            ),
          ),
        ),
      );
  }


  Flexible _buildTail() {
    return Flexible(
      flex: 1,
      child: Container(
        color: Colors.white10,
      ),
    );
  }

  bool checkValue({required BuildContext context}) {
    if (!PostController.to.writingPost.value.isValidTitle()) {
      WaiDialog.showMessage(
        context: context,
        content: "제목을 입력해주세요",
      );
      return false;
    } else if (!PostController.to.writingPost.value.isValidContent()) {
      WaiDialog.showMessage(
        context: context,
        content: "내용을 입력해주세요",
      );
      return false;
    }

    return true;
  }
}
