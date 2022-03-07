import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/controller/main_controller.dart';

class WaiAppbar extends StatelessWidget with PreferredSizeWidget {
  const WaiAppbar({Key? key,
    this.height = 50,
    this.title,
    this.elevation = 2.0,
    this.backgroundColor = Colors.white,
    this.leading,
    this.isBackLeading = false,
    this.actions,
    this.flexibleSpace
  }) : super(key: key);

  final double height;
  final Widget? title;
  final double? elevation;
  final Color? backgroundColor;
  final Widget? leading;
  final bool isBackLeading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;

  @override
  PreferredSize build(BuildContext context) {

    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        toolbarHeight: height,
        flexibleSpace: flexibleSpace,
        title : title,
        elevation: elevation,
        backgroundColor: backgroundColor,
        leading: _buildLeading(),
        actions: actions,
      ),
    );
  }

  Widget? _buildLeading() {

    if (isBackLeading) {
      return _buildBackNavigatorIcon();
    }
    return leading;
  }

  InkWell _buildBackNavigatorIcon() {
    return InkWell(
      child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.grey,),
      onTap: () {
        Get.back();
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

