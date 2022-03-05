import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/widgets/wai_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: WaiButton(
              title: "로그인",
              onPressed: () {}
            ),
          ),
          SizedBox(
            height: 50,
            child: WaiButton(
                title: "네이버 로그인",
                onPressed: () {}
            ),
          ),
          SizedBox(
            height: 50,
            child: WaiButton(
                title: "비회원으로 시작",
                onPressed: () {}
            ),
          )
        ],
      ),
    );
  }
}
