import 'package:flutter/material.dart';
import 'package:wai/common/notification.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/user/user_controller.dart';

class MyReplyTabPage extends StatelessWidget {
  const MyReplyTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // await showNotification();
        WaiDialog.enneagramDialog(myEnneagramTest: UserController.to.currentEnneagramTest.value);
      },
      child: const Text('에니어그램 다이얼로그 테스트')
    );
  }
}
