import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/theme/theme.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double width =  queryData.size.width;
    double boxHeight =  queryData.size.height/15;   // TextField, button의 높이
    double topPadding = boxHeight/10;
    double verticalPadding = 4;
    double horizontalPadding = 15;

    Logger().d(width);
    Logger().d(boxHeight);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("WAI", style: textTheme().headline1,),
              ),
              /* id */
              Container(
                  margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  height: boxHeight,
                  child: TextField(
                    // maxLength: 100,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'phone number or email',
                    ),
                  )
              ),
              /* password */
              Container(
                  margin:EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  height: boxHeight,
                  child: TextField(
                    // maxLength: 100,
                    maxLines: 1,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  )
              ),
              Container(
                margin:EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                child: const PreferredSize(
                    child: Divider(thickness: 0.5, height: 0.25, color: bodyBorderColor),
                    preferredSize: Size.fromHeight(0.5)
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size.fromHeight(boxHeight),
                        textStyle: TextStyle(fontSize: bodyText1Size, color: Colors.black)
                    ),
                    onPressed: () {
                      // debugPrint('Received click');
                    },
                    child: Text('로그인', style: textTheme().bodyText1,),
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size.fromHeight(boxHeight),
                        textStyle: TextStyle(fontSize: bodyText1Size, color: Colors.black)
                    ),
                    onPressed: () {
                      // debugPrint('Received click');
                    },
                    child: Text('회원가입', style: textTheme().bodyText1,),
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: Size.fromHeight(boxHeight),
                        textStyle: TextStyle(fontSize: bodyText1Size, color: Colors.black)
                    ),
                    onPressed: () {
                      // debugPrint('Received click');
                    },
                    child: Text('네이버로그인', style: textTheme().bodyText1,),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
