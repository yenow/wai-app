import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';

class PostWriteChangeImageButton extends StatelessWidget {
  const PostWriteChangeImageButton({Key? key, this.onPressed}) : super(key: key);
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: const Icon(
          Icons.change_circle_rounded,
          color: WaiColors.white70,
        ),
        onPressed: onPressed,
      ),
    );
  }
}