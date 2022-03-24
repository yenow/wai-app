import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/controller/permernent/reply_controller.dart';
import 'package:wai/controller/reply/reply_controller.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/ui/reply_screen/components/reply_page.dart';

class ReplyScreen extends GetView<ReplyController> {
  const ReplyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? postId = Get.parameters['postId'];
    if (postId == null) {
      Get.back();
    }

    return FutureBuilder(
        future: controller.getReplies(postId!),
        builder: (BuildContext context, AsyncSnapshot<List<Reply>> snapshot) {
          if (snapshot.hasData) {
            return ReplyPage(replys: snapshot.data!);

          } else if (snapshot.hasError) {
            return Text('error');

          } else {
            return const Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
            );
          }
        }
    );
  }
}

