import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/screens/custom_appbar.dart';

class PostPageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:  Size.fromHeight(50),
      child: Column(
        children: [
          _title(),
          _author(),
          _content(context),
        ],
      )
    );
  }

  Widget _title() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 100,
        color: Colors.red,
      ),
    );
  }

  Widget _author() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 100,
        color: Colors.orange,
      ),
    );
  }
  Widget _content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 100,
        color: Colors.yellow,
        child: TextButton(
          child: Text('뒤로버튼'),
          onPressed: () {
            // MainController.to.navigatorKeys["page2"]!.currentContext;
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
