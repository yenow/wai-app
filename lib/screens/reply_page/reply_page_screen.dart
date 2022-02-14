import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/controller/reply_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/models/post/post.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/net/post/post_api.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/reply_page/components/reply_form.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/screens/reply_page/reply_page.dart';

import 'components/reply_item.dart';
import 'components/reply_items.dart';


class ReplyPageScreen extends StatefulWidget {
  const ReplyPageScreen({Key? key, required this.postId, this.parentReplyId}) : super(key: key);
  final int postId;
  final int? parentReplyId;

  @override
  _ReplyPageScreenState createState() => _ReplyPageScreenState();
}

class _ReplyPageScreenState extends State<ReplyPageScreen> {
  Future<Post?>? futurePost;
  late Post post;
  late List<Reply> replys;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    futurePost = readPost(widget.postId);
    super.initState();
  }

  void replyPageScreenRebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post?>(
        future: readPost(widget.postId),
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
                post = snapshot.data!;

                if (post.isDelete ?? false) {
                  Get.back();
                }

                replys = post.replys!;
                // ReplyController.to.replys.value = PostController.to.post.value.replys!;
                ReplyController.to.initWriteReplys(
                  postId: post.postId!,
                  parentReplyId: widget.parentReplyId
                );
                return ReplyPage(
                  postId: widget.postId,
                  replys: replys,
                  replyPageScreenRebuild: replyPageScreenRebuild,
                );
              }
          }
        }
    );
  }

  Widget _buildScaffold(BuildContext context) {
    // int replyCount = ReplyController.to.replys.value.length;

    return SafeArea(
      child: Obx(() =>
        Scaffold(
          appBar: WaiAppbar(
            title: Text("댓글 " + replys.length.toString(), style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.white),),
            backgroundColor: lightBlueGrey,   // Colors.white
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.white,),
              onTap: () {
                ReplyController.to.removeReplyWritingInfomation();
                Navigator.pop(context, readPost(widget.postId));
              },
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              replyPageScreenRebuild();
            },
            child: Column(
              children: [
                Expanded(
                  child: _buildReplyItems() // _buildReplyList(context: context)
                ),
                ReplyForm(
                  parentRebuild: replyPageScreenRebuild,
                  parentReplyId: ReplyController.to.replyWritingInfomation.value.parentReplyId!,
                  replyRequestDto: ReplyController.to.replyWritingInfomation.value,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReplyItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        key: _scaffoldKey,
        shrinkWrap: true,
        itemCount: replys.length,
        itemBuilder: (BuildContext context, int index) {
          return ReplyItem(
            reply: replys[index],
            refresh: replyPageScreenRebuild,
            isAction: true,
          ); //_buildReply(replys[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalBorderLine();
        },
      ),
    );
  }
}