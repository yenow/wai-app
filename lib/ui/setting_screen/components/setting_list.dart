import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';

class SettingList extends StatelessWidget {
  const SettingList({Key? key, required this.text, this.onTap}) : super(key: key);
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(text, style: const TextStyle(fontSize: 17, color: WaiColors.mainColor)),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: WaiColors.mainColor),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
