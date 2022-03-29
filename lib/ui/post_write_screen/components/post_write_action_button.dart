import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';

class PostWriteActionButton extends StatelessWidget {
  const PostWriteActionButton({Key? key, this.onPressed}) : super(key: key);
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: const Icon(
          Icons.edit_rounded,
          color: WaiColors.white70,
        ),
        onPressed: onPressed,
      ),
    );
  }
}