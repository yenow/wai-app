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
import 'package:wai/controller/app_controller.dart';
import 'package:wai/controller/enneagram_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/controller/user_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_circular_progress_indicator.dart';
import 'package:wai/common/widgets/wai_popup_menu_button.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/models/post/api/post_save_request_dto.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/net/post/post_api.dart';
import 'package:wai/screens/posts_page/post_write_page.dart';
import 'package:wai/screens/reply_page/components/reply_item.dart';
import 'package:wai/screens/reply_page/components/reply_items.dart';
import 'package:wai/screens/reply_page/reply_page_screen.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void rebuild() {
    setState(() {});
  }

  Future<void> _deletePost() async {
    Post returnPost = await deletePost(post.postId!);
    AppController.to.showSnackBar(WaiSnackBar.bottom(text: "게시물이 삭제되었습니다."));

    Navigator.pop(context, returnPost);
  }

  Future<void> _updatePost() async {
    PostController.to.writingPost.value.postId = post.postId!.toString();
    PostController.to.writingPost.value.title = post.title!;
    PostController.to.writingPost.value.content = post.content!;

    Post returnPost = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => PostWritePage(postId: post.postId!)),
    );

    setState(() {
      post = returnPost;
    });
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Post?>(
        future: readPost(widget.postId),
        builder: (context, snapshot) {

          switch(snapshot.connectionState) {
            case ConnectionState.waiting :
              return const WaiCircularProgressIndicator();
            default :
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                post = snapshot.data!;
                if (snapshot.data!.isDeleted ?? false) {
                  AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.bottom(text: "이미 삭제된 게시글입니다."));
                  Navigator.pop(context, PostController.to.post.value);
                }

                UserController.to.updatePostVisitHistory(post.postId!);
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
              appBar: WaiAppbar(
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
                            _buildTitle(),
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
          ),
          post.user!.userId == UserController.to.user.value.userId ?
            WaiPopupMenuButton(
              valueList: const ['수정하기', '삭제하기'],
              callBackList: [_updatePost, _deletePost],
            )
            : Container()
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Text(PostController.to.post.value.title!, style : CustomTextStyles.postTitleStyle(color: Colors.black87)),
    );
  }

  Widget _buildAuthor() {
    String author = PostController.to.post.value.author ?? "익명";
    int myEnneagramType = PostController.to.post.value.user!.myEnneagramType!;

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        children: [
          Text(DateFormat('yyyy.MM.dd hh:mm').format(PostController.to.post.value.updateDate!), style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
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
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
            const Icon(Icons.arrow_forward_ios_outlined, size: 18, color: Colors.black54,),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyList({required BuildContext context}) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        key: _scaffoldKey,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: post.replys!.length,
        itemBuilder: (BuildContext context, int index) {
          return ReplyItem(
            reply: post.replys![index],
            refresh: rebuild,
            isAction: false,
            // ReplyController.to.updateReplyWritingInfomation(parentReplyId: replys[index].replyId.toString());
          ); //_buildReply(replys[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalBorderLine();
        },
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

        await _goIntoReplyPageScreen();
      },
    );
  }

  SizedBox _buildReplyFormButton() {
    return SizedBox(
      height: 50,
      child: TextButton.icon(
        icon: const Icon(FontAwesomeIcons.commentDots, size: 20, color: Colors.grey,),
        label: Text("댓글을 남겨보세요.",
          style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.grey),
        ),
        onPressed: () async {
          await _goIntoReplyPageScreen();
        },
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal:10),
            alignment: Alignment.centerLeft
        ),
      ),
    );
  }

  Future<void> _goIntoReplyPageScreen() async {
    Post returnPost = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => ReplyPageScreen(postId: PostController.to.post.value.postId!)),
    );

    setState(() {
      post = returnPost;
    });
  }
}