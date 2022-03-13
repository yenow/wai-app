import 'package:flutter/material.dart';
import 'package:wai/ui/enneagram_screen/components/enneagram_tab_button.dart';

class EnneagramTabButtonContainer extends StatelessWidget {
  const EnneagramTabButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          EnneagramTabButton(text: '기본', buttonIndex: 0),
          EnneagramTabButton(text: '날개', buttonIndex: 1, iconData: Icons.air_outlined),
          EnneagramTabButton(text: '장단점', buttonIndex: 2, iconData: Icons.thumb_up_off_alt_outlined),
          EnneagramTabButton(text: '설명', buttonIndex: 3, iconData: Icons.more_horiz_outlined),
        ],
      ),
    );
  }
}
