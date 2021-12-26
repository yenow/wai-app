import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:wai/common/components/input_box.dart';
import 'package:wai/common/constants/color_constants.dart';
import 'package:wai/common/theme/custom_textstyle.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/common/theme/theme.dart';

import '../../controller.dart';

class SimpleLoginPageScreen extends StatelessWidget {
  static MediaQueryData? queryData = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  static double width =  queryData!.size.width;
  static double boxHeight =  queryData!.size.height/13;   // TextField, button의 높이
  static double topPadding = boxHeight/10;
  static double verticalPadding = 4;
  static double horizontalPadding = 40;
  final Controller c = Get.put(Controller());


  @override
  Widget build(BuildContext context) {

    Logger().d(width);
    Logger().d(boxHeight);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromRGBO(190, 159, 225, 0.8),
                Color.fromRGBO(190, 159, 225, 0.8),
                Color.fromRGBO(190, 159, 225, 0.8),
                Color.fromRGBO(190, 159, 225, 0.8)
              ],
            )
        ),
        child: Center(
          child: SingleChildScrollView (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                /* logo */
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: Image(image: AssetImage('assets/images/logo/logo.png'),width: double.infinity, height: 120, fit: BoxFit.fitHeight,),    //Text("WAI", style: textTheme().headline1,)
                ),
                SizedBox(height: 50,),
                /* nickname */
                _nicknameBox(context),
                /* birthday */
                _birthdayBox(context),
                /* gender */
                _genderBox(context),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: const PreferredSize(
                      child: Divider(thickness: 0.5, height: 0.25, color: bodyBorderColor),
                      preferredSize: Size.fromHeight(0.5)
                  ),
                ),
                /* 시작하기 버튼 */
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                    child: SizedBox(
                      width: double.infinity,
                      height: boxHeight,
                      child: TextButton (
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            textStyle: MaterialStateProperty.all(textTheme().bodyText2),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)
                                )
                            )
                        ),
                        onPressed: () {
                          debugPrint('Received click');
                        },
                        child: Text('시작하기',
                            style: GoogleFonts.jua(
                                fontSize: bodyText1Size,
                                color: lavenderColor1
                            )
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: SizedBox(
                    width: double.infinity,
                    height: boxHeight,
                    child: TextButton (
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        textStyle: MaterialStateProperty.all(textTheme().bodyText2),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white)
                            )
                        )
                      ),
                      onPressed: () {
                        debugPrint('Received click');
                      },
                      child: Text('등록된 아이디로 로그인하기',
                        style: GoogleFonts.jua(
                          fontSize: bodyText1Size,
                          color: lavenderColor1
                        )
                      ),
                    ),
                  )
                ),
                // Padding(
                //     padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                //     child: OutlinedButton(
                //       style: OutlinedButton.styleFrom(
                //         minimumSize: Size.fromHeight(boxHeight),
                //         textStyle: TextStyle(fontSize: bodyText1Size, color: Colors.black),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20.0),
                //         ),
                //       ),
                //       onPressed: () {
                //         debugPrint('Received click');
                //       },
                //       child: Text('등록된 아이디로 로그인하기', style: textTheme().bodyText1,),
                //     )
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nicknameBox(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        height: boxHeight,
        child: TextField(
          maxLines: 1,
          cursorColor: Colors.grey,
          style: CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle_size16,
          decoration: InputDecoration(
            fillColor: inputBoxBackgroundColor,
            filled: true,
            prefixIcon: Icon(FontAwesomeIcons.user, color: buttonBorderColor,),
            focusColor: buttonBorderColor,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: buttonBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            floatingLabelStyle: CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle_size16,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: buttonBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            // disabledBorder: OutlineInputBorder(
            //     borderSide: BorderSide(width: 1, color: Colors.white),
            //       borderRadius: BorderRadius.all(Radius.circular(8))
            // ),
            labelText: 'nickname',
          ),
        )
    );
  }

  Widget _birthdayBox(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        height: boxHeight,
        child: TextField(
          maxLines: 1,
          cursorColor: Colors.grey,
          style: CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle_size16,
          decoration: InputDecoration(
            fillColor: inputBoxBackgroundColor,
            filled: true,
            prefixIcon: Icon(FontAwesomeIcons.birthdayCake, color: buttonBorderColor,),
            focusColor: buttonBorderColor,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: buttonBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            floatingLabelStyle: CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle_size16,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: buttonBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            // disabledBorder: OutlineInputBorder(
            //     borderSide: BorderSide(width: 1, color: Colors.white),
            //       borderRadius: BorderRadius.all(Radius.circular(8))
            // ),
            labelText: 'birthday',
          ),
        )
    );
  }

  Widget _genderBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      height: boxHeight,
      child: UnconstrainedBox(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),  // radius of 10
            color: inputBoxBackgroundColor
          ),
          child: Obx(() => ToggleButtons(
            borderColor: buttonBorderColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            children: <Widget>[
              Text('남',style: CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle_size16),
              Text('여',style: CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle_size16)
            ],
            isSelected: c.isGenderList.value ,
            onPressed: (int index) {
              c.setGender(index);
            },
          ))
        ),
        ),
    );
  }
}
