import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';

class WaiButton extends StatelessWidget {
  const WaiButton({
    Key? key,
    this.child,
    this.title = "",
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.radius,
  }) : super(key: key);

  final Widget? child;
  final String title;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: _buildChild(),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size.infinite),
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? WaiColors.blueGrey),
        elevation: MaterialStateProperty.all(1),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // side: BorderSide(color: textColor ?? WaiColors.blueGrey, width: 1),
            borderRadius: BorderRadius.circular(radius ?? 10.0),
            // side: BorderSide(color: Colors.red)
          )
        ),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildChild() => child ?? Text(title, style: WaiTextStyle(color: textColor ?? WaiColors.white).basic());
}
