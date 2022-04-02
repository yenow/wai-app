import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/reply/reply_controller.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/data/model/reply/reply_request_dto.dart';
import 'package:wai/ui/reply_screen/components/reply_form.dart';
import 'package:wai/ui/reply_screen/components/reply_list_view.dart';

class ReplyPage extends StatelessWidget {
  const ReplyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      SafeArea(
        child: FocusOutContainer(
          child: Scaffold(
            appBar: WaiAppbar(
              title: Text('댓글 ${ReplyController.to.replies.length}', style: const TextStyle(color: WaiColors.white),),
              backgroundColor: WaiColors.deepDarkMainColor,
              elevation: 0,
              leading: InkWell(
                child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: WaiColors.white),
                onTap: () {
                  Get.back(result: ReplyController.to.replies.length);
                },
              ),
            ),
            body: RefreshIndicator(
              onRefresh: ReplyController.to.onRefresh,
              child: Column(
                children: const [
                  Expanded(
                    child: ReplyListView()
                  ),
                  ReplyForm()
                ],
              ),
            )
          ),
        )
      ),
    );
  }
}
