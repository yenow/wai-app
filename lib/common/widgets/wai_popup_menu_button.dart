import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';

class WaiPopupMenuButton extends StatefulWidget {
  const WaiPopupMenuButton({Key? key, required this.callList}) : super(key: key);
  final List<void Function()?> callList;

  @override
  _WaiPopupMenuButtonState createState() => _WaiPopupMenuButtonState();
}

class _WaiPopupMenuButtonState extends State<WaiPopupMenuButton> {
  final List<String> _valueList = ['수정하기', '삭제하기', '신고하기'];
  late final List<void Function()?> _callList;

  @override
  void initState() {
    _callList = widget.callList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        iconSize: 20,
        icon: const Icon(Icons.more_vert_outlined, color: WaiColors.grey,),
        onSelected: (String value) {
        },
        itemBuilder: (BuildContext context) {
          return _valueList.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice, style: WaiTextStyle(fontSize: 14).bodyText(),),
              onTap: () {
                for (String temp in _valueList) {
                  if (temp == choice) {
                    logger.d(choice);
                    _callList[_valueList.indexOf(temp)]!();
                  }
                }
              },
            );
          }).toList();
        },
      ),
    );
  }
}
