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
import 'package:wai/models/post/post.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/reply_page/components/reply_form.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

import 'components/reply_items.dart';


class ReplyPageScreen extends StatefulWidget {
  const ReplyPageScreen({Key? key, required this.postId, this.parentReplyId}) : super(key: key);
  final int postId;
  final int? parentReplyId;

  @override
  _ReplyPageScreenState createState() => _ReplyPageScreenState();
}

class _ReplyPageScreenState extends State<ReplyPageScreen> {
  late Post post;

  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                post = snapshot.data!;

                if (PostController.to.post.value.isDelete ?? false) {
                  Get.back();
                }
                ReplyController.to.replys.value = PostController.to.post.value.replys!;
                ReplyController.to.initReplys(widget.parentReplyId);
                return _buildScaffold(context);
              }
          }
        }
    );
  }

  Widget _buildScaffold(BuildContext context) {
    // int replyCount = ReplyController.to.replys.value.length;

    return Obx(() =>
      SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
            child: AppBar(
              title: Text("댓글 " + ReplyController.to.replys.value.length.toString(), style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.white),),
              // elevation: 2.0,
              backgroundColor: lightBlueGrey,   // Colors.white
              leading: GestureDetector(
                child: Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.white,),
                onTap: () {
                  ReplyController.to.removeReplyWritingInfomation();
                  Navigator.pop(context, PostController.to.readPost(widget.postId));
                },
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              rebuild();
            },
            child: Column(
              children: [
                Expanded(
                  child: ReplyItems(
                    replys: ReplyController.to.replys.value,
                    isScroll: true,
                    reReplyFunction: () {},
                  ) // _buildReplyList(context: context)
                ),
                ReplyForm(parentRebuild : rebuild)
              ],
            ),
          ),
        ),
      ),
    );
  }
}