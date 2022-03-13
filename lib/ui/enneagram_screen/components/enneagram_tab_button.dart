import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';

class EnneagramTabButton extends StatelessWidget {
  const EnneagramTabButton({
    Key? key,
    required this.text,
    required this.buttonIndex,
    this.iconData = Icons.menu,
    this.buttonColor = WaiColors.white,
    this.iconAndTextColor = WaiColors.lightMainColor
  }) : super(key: key);
  final String text;
  final int buttonIndex;
  final IconData iconData;// = Icons.menu,
  final Color buttonColor; //= Colors.white,
  final Color iconAndTextColor; //= WaiColors.lightBlueGrey


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // EnneagramController.to.tabChange(buttonIndex);
            },
            child: Icon(iconData, color: iconAndTextColor),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const CircleBorder()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                // if (EnneagramController.to.enneagramTypePageIndex == buttonIndex) {
                //   return WaiColors.lightYellow;
                // } else {
                //   return Colors.white;
                // }
                return Colors.white;

              }), // Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) return WaiColors.lightYellow; // Splash color
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: TextStyle(color: iconAndTextColor)),
          )
        ],
      ),
    );
  }
}
