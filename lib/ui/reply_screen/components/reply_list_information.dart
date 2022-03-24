import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/common/widgets/wai_popup_menu_button.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/user_controller.dart';
import 'package:wai/data/model/reply/reply.dart';

class ReplyListInformation extends StatelessWidget {
  const ReplyListInformation({Key? key, required this.reply}) : super(key: key);
  final Reply reply;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // const Blank(width: 10,),
            Image(image: AssetImage(EnneagramController.to.enneagram[reply.authorEnneagramType]!.imagePath), width: 18, height: 18,  fit: BoxFit.fill,),
            const Blank(width: 5,),
            Text(reply.author!, style: const TextStyle(fontSize: 15, color: Colors.black45)),
            const Blank(width: 10,),
            BlockText(text: "${reply.authorEnneagramType}유형"),
          ],
        ),
        waiPopupMenuButton()
      ],
    );
  }

  Widget waiPopupMenuButton() {
    return reply.userId == UserController.to.user.value.userId ?
      WaiPopupMenuButton(
        valueList: const ['수정하기', '삭제하기'],
        callBackList: [() {}, () {}],
      ) : WaiPopupMenuButton(
      valueList: const [ '신고하기'],
      callBackList: [() {}],
    );
  }
}
