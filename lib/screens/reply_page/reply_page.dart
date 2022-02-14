import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/reply_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/net/post/post_api.dart';

import 'components/reply_form.dart';
import 'components/reply_item.dart';

class ReplyPage extends StatefulWidget {
  const ReplyPage({Key? key, required this.postId, required this.replys, this.replyPageScreenRebuild}) : super(key: key);
  final int postId;
  final List<Reply> replys;
  final VoidCallback? replyPageScreenRebuild;

  @override
  _ReplyPageState createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  late List<Reply> replys;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    replys = widget.replys;
    super.initState();
  }

  void replyPageRebuild() {
    setState(() {});
  }

  void reReplyCallback ({required String parentReplyId, required String parentAuthor}) {
    ReplyController.to.replyWritingInfomation.value.parentReplyId = parentReplyId; //  reply.replyId!.toString();
    ReplyController.to.replyWritingInfomation.value.parentAuthor = parentAuthor; // reply.author;
    replyPageRebuild();
    logger.d(ReplyController.to.replyWritingInfomation);
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: WaiAppbar(
          title: Text("댓글 " + replys.length.toString(), style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.white),),
          backgroundColor: WaiColors.lightBlueGrey,   // Colors.white
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
            replyPageRebuild();
          },
          child: Column(
            children: [
              Expanded(
                  child: _buildReplyItems() // _buildReplyList(context: context)
              ),
              ReplyForm(
                parentRebuild: widget.replyPageScreenRebuild,
                rebuild : replyPageRebuild,
                parentReplyId: ReplyController.to.replyWritingInfomation.value.parentReplyId!,
                replyRequestDto: ReplyController.to.replyWritingInfomation.value,
              )
            ],
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
            refresh: widget.replyPageScreenRebuild,
            isAction: true,
            reReplyCallback: reReplyCallback,
          ); //_buildReply(replys[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalBorderLine();
        },
      ),
    );
  }
}
