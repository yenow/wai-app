import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/utils/wai_dialog.dart';
import '../../../../route.dart';

class MyPageActionButton extends StatelessWidget {
  const MyPageActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: const Icon(
          Icons.edit_rounded,
        ),
        onPressed: () async {
          var response = await Get.toNamed(WaiRoutes.myEdit);
          if (response != null) {
            // UserController.to.updateUser(response);
            WaiDialog.notify("알림", "내정보가 수정되었습니다.");
          }
        },
      ),
    );
  }
}
