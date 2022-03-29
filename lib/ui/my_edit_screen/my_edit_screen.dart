import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/my_edit_controller.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/my_edit_screen/components/my_edit_action_button.dart';
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
            isBackLeading: true,
            backgroundColor: Colors.transparent,
            title: Text('내정보 수정하기', style: TextStyle(color: WaiColors.white),),
            actions: [
              MyEditActionButton()
            ],
          ),
          body: Column(
            children: [
              const MyEditImageContainer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                alignment: Alignment.centerLeft,
                child: const Text('닉네임', style: TextStyle(fontSize: 22, color: WaiColors.mainColor),)
              ),
              // const Blank(height: 20,),
              MyEditForm()
            ],
          ),
    ),
      ));
  }
}
