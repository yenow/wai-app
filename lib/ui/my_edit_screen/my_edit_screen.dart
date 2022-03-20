import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/my_edit_controller.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/my_edit_screen/components/my_edit_form.dart';
import 'package:wai/ui/my_edit_screen/components/my_edit_image_container.dart';

import '../../common/widgets/blank.dart';
import '../../common/widgets/focus_out_container.dart';

class MyEditScreen extends StatelessWidget {
  const MyEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FocusOutContainer(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const WaiAppbar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('내정보 수정하기', style: TextStyle(color: WaiColors.white),),
            actions: [
              MyEditActionButton()
            ],
          ),
          body: Column(
            children: [
              MyEditImageContainer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text('닉네임', style: TextStyle(fontSize: 22, color: WaiColors.blueGrey),)
              ),
              // const Blank(height: 20,),
              MyEditForm()
            ],
          ),
    ),
      ));
  }
}


class MyEditActionButton extends StatelessWidget {
  const MyEditActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: const Icon(
          Icons.check_circle_rounded,
          color: WaiColors.white,
          size: 25,
        ),
        onPressed: MyEditController.to.clickCompleteButton,
      ),
    );
  }
}
