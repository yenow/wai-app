import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/notice_controller.dart';
import 'package:wai/ui/main_screen/notice_page/components/notice_list.dart';

class NoticeListView extends StatelessWidget {
  const NoticeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      NoticeController.to.notices.isEmpty ?
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: const Center(child: Text('새로운 알림이 없습니다.', style: TextStyle(fontSize: 20, color: WaiColors.white70),)),
      ) :
      RefreshIndicator(
        onRefresh: () async {},
        child: ListView.separated(
          padding: EdgeInsets.zero,
          controller: NoticeController.to.scrollController,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: NoticeController.to.notices.length,
          itemBuilder: (BuildContext context, int index) {
            return NoticeList(key: UniqueKey(), index: index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const HorizontalBorderLine(height: 0.5, color: WaiColors.white70,);
          },
        ),
      ),
    );
  }
}
