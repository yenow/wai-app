import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/controller/reply_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/screens/reply_page/components/reply_item.dart';
import 'package:wai/widgets/black.dart';
import 'package:wai/widgets/block_text.dart';
import 'package:wai/widgets/horizontal_border_line.dart';

class ReplyItems extends StatelessWidget {
  const ReplyItems({Key? key, required this.replys, required this.reReplyFunction, required this.isScroll}) : super(key: key);
  final List<Reply> replys;
  final VoidCallback reReplyFunction;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    return _buildReplyList(context: context);
  }

  Widget _buildReplyList({required BuildContext context}) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        shrinkWrap: true,
        physics: isScroll ? null : NeverScrollableScrollPhysics(),
        itemCount: replys.length,
        itemBuilder: (BuildContext context, int index) {
          return ReplyItem(
            reply: replys[index],
            reReplyFunction: () {
              ReplyController.to.updateReplyWritingInfomation(parentReplyId: replys[index].replyId.toString());
              reReplyFunction();
            }
          ); //_buildReply(replys[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalBorderLine();
        },
      ),
    );
  }

  Column _buildReply(Reply reply) {
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
            TextButton(
              child: Text("답글쓰기", style: CustomTextStyles.buildTextStyle(fontSize: 12, color: Colors.grey)),
              onPressed: () {

              },
            )
          ],
        ),
        const Blank(height: 10,),
      ],
    );
  }

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
}
