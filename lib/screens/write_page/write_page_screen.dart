import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wai/common/constants/custom_colors.dart';
import 'package:wai/common/theme/custom_postpage_textstyle.dart';

class WritePageScreen extends StatelessWidget {
  const WritePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              child: Container(
                child: TextField(
                    cursorColor: Colors.grey,
                    maxLength: 100,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.postTitleText,
                    decoration: InputDecoration(
                      labelText: "제목",
                      labelStyle: Theme.of(context).textTheme.postingLabelText,
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: UnderlineInputBorder (
                        borderSide: BorderSide(width: 1, color: buttonBorderColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: buttonBorderColor),
                      ),
                      counterText:'',
                      // prefixIcon: prefixIcon,
                      // focusColor: buttonBorderColor,
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Colors.grey),)
                ),
                child: TextField(
                    cursorColor: Colors.grey,
                    maxLength: 4000,
                    maxLines: 10,
                    style: Theme.of(context).textTheme.postTitleText,
                    decoration: InputDecoration(
                      labelText: '내용',
                      labelStyle: Theme.of(context).textTheme.postingLabelText,
                      fillColor: Colors.white,
                      filled: true,
                      // hintText: '내용',
                      counterText: '',
                      border: InputBorder.none,
                    )
                ),
              ),
            ),
          ],
        ),
    );
  }
}
