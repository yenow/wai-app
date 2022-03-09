import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/controller/permenent/post_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/api/post_save_request_dto.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/net/post/post_api.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_dialog.dart';

class PostWritePage extends StatelessWidget {
  const PostWritePage({Key? key, this.postId}) : super(key: key);
  final int? postId;

  @override
  Widget build(BuildContext context) {
    logger.d(PostController.to.writingPost.value.postId!);

    return Obx(() =>
      Scaffold(
        appBar: WaiAppbar(
          title: const Text("게시글 작성"),
          leading: _buildAppbarLeading(context),    // 뒤로가기 아이콘
          actions: [
            _buildAppbarActions(context)    // 게시글 등록 아이콘
          ],
        ),
        // resizeToAvoidBottomInset : false,
        body: FocusOutContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInputTitle(),
              _buildInputContent(),
              _buildTail()
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildAppbarLeading(BuildContext context) {
    return GestureDetector(
      child: const Icon(FontAwesomeIcons.chevronLeft, size: 20, color: Colors.black54,),
      onTap: () {
        WaiDialog.showConfirmMessage(
            context: context,
            content: "게시글 작성중입니다. 뒤로 가시겠습니까?",
            confirmOnPress: () {
              Get.back();
            }
        );
      },
    );
  }

  Widget _buildAppbarActions(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: InkWell(
        onTap: () async {
          PostController.to.writingPost.value.userId = UserController.to.user.value.userId!.toString();
          PostController.to.writingPost.value.userKey = AppController.to.loginInfo.value.userKey;
          PostController.to.writingPost.value.author = UserController.to.user.value.nickname ?? "익명";

          if (checkValue()) {

            /* api request */
            PostSaveRequestDto postSaveRequestDto = PostController.to.writingPost.value;
            postSaveRequestDto.authorEnneagramType = UserController.to.user.value.myEnneagramType;
            Post post = await savePost(postSaveRequestDto);

            /* after request */
            PostController.to.removeWritingPost();

            // Get.back();

            Navigator.pop(context, post);
            if (postId == null) {
              AppController.to.showSnackBar(WaiSnackBar.bottom(text: "게시물이 등록되었습니다."));
            } else {
              AppController.to.showSnackBar(WaiSnackBar.bottom(text: "게시물이 수정되었습니다."));
            }
          }
        },
        child: const Icon(FontAwesomeIcons.checkCircle, size: 25, color: Colors.black54,),
      ),
    );
  }

  Widget _buildInputTitle() {
    return TextField(
        cursorColor: Colors.grey,
        maxLength: 100,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
          enabledBorder: const UnderlineInputBorder (
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          counterText:'',
          // prefixIcon: prefixIcon,
          // focusColor: Colors.grey,
        )
    );
  }

  Widget _buildInputContent() {
    return Flexible(
      flex: 9,
      fit: FlexFit.loose,
      child: TextField(
        cursorColor: Colors.grey,
        maxLength: 4000,
        // minLines: 1,
        maxLines: null,
        expands: true,
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
          border: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: const UnderlineInputBorder (
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),

        ),
      ),
    );
  }


  Widget _buildTail() {
    return SizedBox(
      height: 40,
      child: Container(
        color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: LayoutBuilder(builder: (context, constraint) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: IconButton(
                    icon: Icon(Icons.photo_camera_outlined, size: constraint.biggest.height, color: Colors.grey),
                    padding: EdgeInsets.zero,
                    onPressed: () {

                    },
                  )
                ),
              ],
            );
          }),
        ),/*Row(
          children: [
            Icon(Icons.photo_camera_outlined, size: 50, color: Colors.grey),
          ],
        ),*/
      ),
    );
  }

  bool checkValue() {
    if (!PostController.to.writingPost.value.isValidTitle()) {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.bottom(text: "제목을 입력해주세요."));
      return false;
    } else if (!PostController.to.writingPost.value.isValidContent()) {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.bottom(text: "내용을 입력해주세요."));
      return false;
    }

    return true;
  }
}
