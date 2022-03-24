import 'package:get/get.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/data/client/reply_client.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/main.dart';

class ReplyController extends GetxController {
  static ReplyController get to => Get.put(ReplyController());
  final replies = <Reply>[].obs;

  Future<List<Reply>> getReplies(String postId) async {
    await ReplyClient(mainDio).getReplies(
        postId: postId,
        token: AppController.to.getJwtToken()
    ).then((value) {
      replies(value);
    });
    return replies;
  }
}