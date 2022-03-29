import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/controller/reply/reply_controller.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/ui/reply_screen/components/reply_list.dart';

class ReplyListView extends StatelessWidget {
  const ReplyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(()=>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ReplyController.to.replies.length,
          itemBuilder: (BuildContext context, int index) {
            return ReplyList(index: index);
          },
          // separatorBuilder: (BuildContext context, int index) {
          //   return const HorizontalBorderLine();
          // },
        ),
      ),
    );
    return Container();
  }
}
