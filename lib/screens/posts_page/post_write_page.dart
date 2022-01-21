import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/custom_postpage_textstyle.dart';
import 'package:wai/common/theme/custom_textstyles.dart';

import '../../widgets/custom_appbar.dart';

class PostWritePage extends StatelessWidget {
  const PostWritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MainController.to.appBarState.value.appbarSize),   // MainController.to.appBarState.value.appbarSize
          child: AppBar(
            title: Text("게시글 작성"),
            elevation: 2.0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              child: Icon(FontAwesomeIcons.chevronLeft, size: 20, color: Colors.blueGrey,),
              onTap: () {
                MainController.to.back();
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: GestureDetector(
                  onTap: () {
                    checkValue();

                    // todo 1. 유효성검증  2. DB  3. 캐시데이터 삭제후, 페이지 이동
                  },
                  child: Icon(FontAwesomeIcons.checkCircle, size: 25, color: Colors.blueGrey,),
                ),
              ),
            ],
          ),
        ),
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

  void checkValue() {
    if (!PostController.to.writingPost.value.isValidTitle()) {
      // message출력?
    } else if (!PostController.to.writingPost.value.isValidContent()) {

    }

  }
}
