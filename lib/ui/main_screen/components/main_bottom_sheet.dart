import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_textstyle.dart';

class MainBottomSheet extends StatelessWidget {
  const MainBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
      child: Container(
        height: 200,
        color: Colors.white,
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            _header(),
            const Blank(height: 10,),
            InkWell(
              child: Row(
                children: [
                  Icon(Icons.add, size: 17, color: Colors.black54),
                  const Blank(width: 10,),
                  Text('글쓰기', style: waiTextStyle(fontSize: 17, color: Colors.black54))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('만들기', style: waiTextStyle(fontSize: 17, color: Colors.black54)),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }
}
