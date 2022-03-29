import 'package:flutter/material.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const WaiAppbar(
          title: Text('로그인', style: TextStyle(color: WaiColors.white),),
          backgroundColor: WaiColors.lightMainColor,
          elevation: 0,
        ),
        body: Container(

        ),
      )
    );
  }
}
