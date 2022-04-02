import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/notice_controller.dart';
import 'package:wai/ui/main_screen/notice_page/components/notice_list_view.dart';

import '../components/wai_drawer.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const WaiDrawer(),
      appBar: const WaiAppbar(
        title: Text('알림', style: TextStyle(color: WaiColors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/background/moon.jpg"),
            opacity: 0.8,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(WaiColors.black70.withOpacity(0.6), BlendMode.color),
          ),
        ),
        child: Column(
          children: [
            const Blank(height: 50,),
            const Flexible(
              fit: FlexFit.loose,
              child: NoticeListView()
            ),
            NoticeController.to.notices.isEmpty ?
            Container() :
            SizedBox(
              height: 50,
              child: WaiButton(
                child: const Text('모두 지우기', style: TextStyle(color: WaiColors.white, fontSize: 20),),
                backgroundColor: WaiColors.transparent,
                onPressed: NoticeController.to.clearAllNotice
              ),
            ),
            const Blank(height: 60,)
          ],
        ),
      ),
    );
  }
}
