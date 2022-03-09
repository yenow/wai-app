import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/reply_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/navigation_service.dart';
import 'package:wai/common/widgets/wai_popup_menu_button.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/common/utils/date_util.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/net/reply/reply_api.dart';
import 'package:wai/screens/reply_page/reply_modify_page.dart';

class ReplyItem extends StatelessWidget {
  const ReplyItem({Key? key, required this.reply, this.refresh, required this.isAction, this.reReplyCallback}) : super(key: key);
  final Reply reply;
  final VoidCallback? refresh;
  final bool isAction;
  final Function({required String parentReplyId, required String parentAuthor})? reReplyCallback;

  Future<void> _deleteReplyItem() async {
    ReplyRequestDto replyRequestDto = ReplyRequestDto(
      replyId: reply.replyId!.toString(),
    );
    await deleteReply(replyRequestDto);
    refresh!();
    AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.bottom(text: "댓글이 삭제되었습니다."));
  }

  Future<void> reportReplyItem() async {
    ReplyRequestDto replyRequestDto = ReplyRequestDto(
      replyId: reply.replyId!.toString(),
    );
    await reportReply(replyRequestDto);
    refresh!();
    AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.bottom(text: "댓글이 신고되었습니다."));
  }

  void _updateReplyItem() async {
    await Navigator.push(NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => ReplyModifyPage(reply: reply)),
    );

    if (refresh != null) {
      refresh!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.fromLTRB(reply.parentReplyId != null ? 30 : 0 , 0, 0, 0),
      child: Column(
        children: [
          const Blank(height: 10,),
          _buildReplyInfomation(),
          _replyContent(),
          _buildDateTime(),
          const Blank(height: 10,),
        ],
      ),
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
        reply.user!.userId == UserController.to.user.value.userId && isAction ?
          WaiPopupMenuButton(
            valueList: const ['수정하기', '삭제하기'],
            callBackList: [_updateReplyItem, _deleteReplyItem],
          )
          : Container()
      ],
    );
  }

  Widget _replyContent() {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Blank(width: 20,),
          Text.rich(
            TextSpan(
              text: reply.parentAuthor,
              style: CustomTextStyles.buildTextStyle(fontSize: 16, color: WaiColors.lightBlueGrey),
              children: [
                TextSpan(
                  text: "  ",
                  style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black54),
                ),
                TextSpan(
                  text:reply.replyContent!,
                  style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black54),
                ),
              ]
            ),
          )
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
          Text(dateTimeToString(AppController.to.nowServerTime.value ,reply.updateDate!), style: CustomTextStyles.buildTextStyle(fontSize: 12, color: Colors.grey)),
          const Blank(width: 10,),
          isAction ? TextButton(
            child: Text("답글쓰기", style: CustomTextStyles.buildTextStyle(fontSize: 12, color: Colors.grey)),
            onPressed: () {
              if (reReplyCallback != null) {
                reReplyCallback!(parentReplyId: reply.replyId!.toString(), parentAuthor: reply.author!);
              }
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(0, 3, 0, 0)
            ),
          ) : Container()
        ],
      ),
    );
  }
}


