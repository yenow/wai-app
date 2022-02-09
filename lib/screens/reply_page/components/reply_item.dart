import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/widgets/wai_popup_menu_button.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/common/utils/date_util.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/net/reply/reply_api.dart';

class ReplyItem extends StatelessWidget {
  const ReplyItem({Key? key, required this.reply, this.reReplyFunction}) : super(key: key);
  final Reply reply;
  final VoidCallback? reReplyFunction;

  Future<void> deleteReplyItem() async {
    ReplyRequestDto replyRequestDto = ReplyRequestDto(
      postId: reply.replyId!.toString(),
    );
    await deleteReply(replyRequestDto);
    reReplyFunction!();
  }

  @override
  Widget build(BuildContext context) {
    return _buildReply();
  }

  Column _buildReply() {
    return Column(
      children: [
        const Blank(height: 10,),
        _buildReplyInfomation(),
        _replyContent(),
        _buildDateTime(),
        const Blank(height: 10,),
      ],
    );
  }

  Row _buildReplyInfomation() {
    String replyAuthor = reply.user!.nickname ?? "익명"; 
    int myEnneagramType = reply.user!.myEnneagramType!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // const Blank(width: 10,),
            Image(image: AssetImage(EnneagramController.to.enneagram![reply.user!.myEnneagramType!]!.imagePath), width: 18, height: 18,  fit: BoxFit.fill,),
            const Blank(width: 5,),
            Text(replyAuthor, style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.black45)),
            const Blank(width: 10,),
            BlockText(text: "$myEnneagramType유형"),
          ],
        ),
        reply.user!.userId == UserController.to.user.value.userId ? WaiPopupMenuButton(
          callList: [deleteReplyItem, () {}, () {}],
        ) : Container()
        // Icon(
        //   Icons.more_vert_outlined,
        //   color: WaiColors.grey,
        // ),
      ],
    );
  }

  Widget _replyContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Blank(width: 20,),
          Text(reply.replyContent!, style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black54),),
        ],
      ),
    );
  }

  SizedBox _buildDateTime() {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          const Blank(width: 20,),
          Text(dateTimeToString(AppController.to.nowServerTime.value ,reply.insertDate!), style: CustomTextStyles.buildTextStyle(fontSize: 12, color: Colors.grey)),
          const Blank(width: 10,),
          TextButton(
            child: Text("답글쓰기", style: CustomTextStyles.buildTextStyle(fontSize: 12, color: Colors.grey)),
            onPressed: reReplyFunction,
            style: TextButton.styleFrom(
              padding: EdgeInsets.fromLTRB(0, 3, 0, 0)
            ),
          )
        ],
      ),
    );
  }
}


