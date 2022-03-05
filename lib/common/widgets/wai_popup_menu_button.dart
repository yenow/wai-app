import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';

class WaiPopupMenuButton extends StatefulWidget {
  const WaiPopupMenuButton({Key? key, required this.valueList, required this.callBackList}) : super(key: key);
  final List<String> valueList;
  final List<void Function()?> callBackList;

  @override
  _WaiPopupMenuButtonState createState() => _WaiPopupMenuButtonState();
}

class _WaiPopupMenuButtonState extends State<WaiPopupMenuButton> {
  late final List<String> _valueList;
  late final List<void Function()?> _callBackList;

  @override
  void initState() {
    _valueList = widget.valueList;
    _callBackList = widget.callBackList;
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
          for (String temp in _valueList) {
            if (temp == value) {
              _callBackList[_valueList.indexOf(temp)]!();
            }
          }
        },
        itemBuilder: (BuildContext context) {
          return _valueList.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice, style: WaiTextStyle(fontSize: 14).bodyText(),),
              onTap: () {
              },
            );
          }).toList();
        },
      ),
    );
  }
}
