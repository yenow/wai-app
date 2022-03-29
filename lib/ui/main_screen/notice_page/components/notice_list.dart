import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/notice_controller.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({Key? key, required this.index}) : super(key: key);
  final int index;


  @override
  Widget build(BuildContext context) {
    return NoticeController.to.notices.elementAt(index).isRead! ?
      Container() :
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const Blank(width: 20,),
            const Icon(Icons.account_circle, size: 30, color: WaiColors.white70,),
            const Blank(width: 20,),
            Expanded(
              child: InkWell(
                onTap: () {
                  NoticeController.to.goPage(NoticeController.to.notices.elementAt(index));
                },
                child: AutoSizeText(
                  '${NoticeController.to.notices.elementAt(index).giverNickname}님이 회원님 글에 댓글을 달았습니다.',
                  style: const TextStyle(fontSize: 18, color: WaiColors.white70),
                  maxLines: 2,
                ),
              ),
            ),
            const Blank(width: 10,),
            IconButton(
              icon: const Icon(Icons.close, size: 20, color: WaiColors.white70,),
              onPressed: () {
                NoticeController.to.clearNotice(NoticeController.to.notices.elementAt(index));
              },
            ),
            const Blank(width: 10,),
          ],
        ),
      );
  }
}
