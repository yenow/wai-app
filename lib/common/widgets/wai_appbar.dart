import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/controller/main_controller.dart';

class WaiAppbar extends StatelessWidget with PreferredSizeWidget {
  const WaiAppbar({Key? key,
    this.height = 50,
    this.title,
    this.elevation = 2.0,
    this.backgroundColor = Colors.white,
    this.leading
  }) : super(key: key);

  final double height;
  final Widget? title;
  final double? elevation;
  final Color? backgroundColor;
  final Widget? leading;

  @override
  PreferredSize build(BuildContext context) {

    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        title : title,
        elevation: elevation,
        backgroundColor: backgroundColor,
        leading: leading,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

