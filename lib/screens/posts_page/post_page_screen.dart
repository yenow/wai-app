import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/screens/reply_page/components/reply_items.dart';
import 'package:wai/screens/reply_page/reply_page_screen.dart';
import 'package:wai/common/utils/date_util.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/common/widgets/custom_appbar.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

import 'components/likey_button.dart';

class PostPageScreen extends StatefulWidget {
  const PostPageScreen({Key? key, required this.postId}) : super(key: key);
  final int postId;

  @override
  _PostPageScreenState createState() => _PostPageScreenState();
}

class _PostPageScreenState extends State<PostPageScreen> {
  late Post post;

  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    loggerNoStack.d("build PostPageScreen");

    return FutureBuilder<Post?>(
        future: PostController.to.readPost(widget.postId),
        builder: (context, snapshot) {

          switch(snapshot.connectionState) {
            case ConnectionState.waiting :
              return const Scaffold(
                  body: Center(
                      child: CircularProgressIndicator()
                  )
              );
            default :
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // post = snapshot.data;
                post = snapshot.data!;
                if (snapshot.data!.isDelete ?? false) {
                  Get.back();
                }
                PostController.to.post.value = snapshot.data!;
                return _buildScaffold(context);
              }
          }
        }
    );
  }

  Widget _buildScaffold(BuildContext context) {

    return Obx(()=>
        SafeArea(
          child: Scaffold(
              appBar: _buildAppbar(context),
              body: RefreshIndicator(
                onRefresh: () async {
                  rebuild();
                },
                child: Column(
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
                            _buildReplyFormButton()
                          ]
                      ),
                    ),
                    _buildBottomArea()
                  ],
                ),
              )
          ),
        ),
    );
  }

  PreferredSize _buildAppbar(BuildContext context) {
    return PreferredSize(
              preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
              child: AppBar(
                title: Text("게시글", style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.white),),
                // elevation: 2.0,
                backgroundColor: lightBlueGrey,   // Colors.white
                leading: GestureDetector(
                  child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.white,),
                  onTap: () {
                    Navigator.pop(context, PostController.to.post.value);
                  },
                ),
              ),
            );
  }

  Padding _buildInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image(image: AssetImage(EnneagramController.to.enneagram![PostController.to.post.value.user!.myEnneagramType!]!.imagePath), width: 26, height: 26,  fit: BoxFit.fill,),
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
      child: Text(PostController.to.post.value.title!, style : CustomTextStyles.postTitleStyle(color: Colors.black87)),
    );
  }

  Widget _buildAuthor() {
    String author = PostController.to.post.value.author ?? "익명";
    int myEnneagramType = PostController.to.post.value.user!.myEnneagramType!;

    return Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(author, style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
            const Blank(width: 10,),
            BlockText(text: "$myEnneagramType유형"),
          ],
        )
    );
  }

  Widget _buildPostInfomation() {
    int clickCount = PostController.to.post.value.clickCount ?? 0;
    int likeyCount = PostController.to.post.value.likeyCount ?? 0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        children: [
          Text(DateFormat('yyyy.MM.dd hh:mm').format(PostController.to.post.value.insertDate!), style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
          const Blank(width: 8,),
          Row(
            children: [
              const Icon(Icons.visibility_outlined, size: 15, color: Colors.black45 ),
              const Blank(width: 2,),
              Text("$clickCount", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
            ],
          ),
          const Blank(width: 8,),
          Row(
            children: [
              const Icon(Icons.favorite_border_outlined, size: 15, color: Colors.black45 ),
              const Blank(width: 2,),
              Text("$likeyCount", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
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
        child: Text(PostController.to.post.value.content!, style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.black54),)
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
            Text(PostController.to.post.value.replys!.length.toString(), style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.black54)),
            const Blank(width: 10),
            Icon(Icons.arrow_forward_ios_outlined, size: 18, color: Colors.black54,),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyList({required BuildContext context}) {

    return ReplyItems(
        replys: PostController.to.post.value.replys!,
        isScroll: false,
        reReplyFunction: () {
        }
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


  Widget _buildBottomArea() {

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
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                LikeyButton(
                  likeyCount: PostController.to.post.value.likeyCount!,
                  isLikey:  PostController.to.getIsLikey(),
                  onPressed: () {

                    if (PostController.to.getIsLikey()) {
                      PostController.to.removeLikey();
                    } else {
                      PostController.to.addLikey();
                    }
                  },
                ),
                _buildReplyButton(PostController.to.post.value.replys!.length),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconButton _buildReplyButton(int replyLength) {
    return IconButton(
      icon: Row(
        children: [
          const Icon(FontAwesomeIcons.commentDots, size: 18, color: Colors.black45 ),
          const Blank(width: 5),
          Text(replyLength.toString(), style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black45)),
        ],
      ),
      iconSize: 18,
      padding: EdgeInsets.zero,
      onPressed: () async {

        await _GoIntoReplyPageScreen();
      },
    );
  }

  SizedBox _buildReplyFormButton() {
    return SizedBox(
      height: 50,
      child: TextButton.icon(
        icon: Icon(FontAwesomeIcons.commentDots, size: 20, color: Colors.grey,),
        label: Text("댓글을 남겨보세요.",
          style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.grey),
        ),
        onPressed: () async {
          await _GoIntoReplyPageScreen();
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal:10),
            alignment: Alignment.centerLeft
        ),
      ),
    );
  }

  Future<void> _GoIntoReplyPageScreen() async {
    Post returnPost = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => ReplyPageScreen(postId: PostController.to.post.value.postId!)),
    );

    setState(() {
      post = returnPost;
    });
  }
}