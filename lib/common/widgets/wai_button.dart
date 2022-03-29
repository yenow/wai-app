import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';

class WaiButton extends StatelessWidget {
  const WaiButton({
    Key? key,
    this.child,
    this.title = "",
    required this.onPressed,
    this.backgroundColor,
    this.overlayColor = Colors.transparent,
    this.textColor,
    this.radius,
    this.size = Size.infinite,
  }) : super(key: key);

  final Widget? child;
  final String title;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Color? textColor;
  final double? radius;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: _buildChild(),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        minimumSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? WaiColors.blueGrey),
        elevation: MaterialStateProperty.all(1),
        overlayColor: MaterialStateProperty.all(overlayColor ?? WaiColors.lightMainColor),
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
