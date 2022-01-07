import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/custom_colors.dart';
import 'package:wai/common/theme/custom_loginpage_textstyle.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/models/api_response/login_response_dto.dart';
import 'package:wai/models/simply_login_info.dart';
import 'package:wai/net/login/login_api.dart';
import 'package:wai/screens/login_page/login_page_screen.dart';
import 'package:wai/sample/sample_screens.dart';
import 'package:wai/utils/dialog.dart';
import '../../common/controller/controller.dart';
import '../main_screens.dart';
import 'components/login_page_button.dart';
import 'components/login_page_inputbox.dart';

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
    // Logger().d('width : $width');
    // Logger().d('boxHeight : $boxHeight');

    return Obx(() =>  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage("assets/images/background/night-4822906.png"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
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
                SizedBox(height: 20,),
                /* nickname Input box */
                Container(
                  margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  height: boxHeight,
                  child: LoginPageInputBox(
                    labelText: '닉네임',
                    prefixIcon: const Icon(FontAwesomeIcons.user, color: buttonLabelColor),
                    maxLength: 10,
                    onChanged: (value) {
                      c.setNickname(value);
                      Logger().d('nickname : ${c.simpleLoginInfo.value!.nickname}');
                    },
                  ),
                ),
                /* birthDay Input box */
                Container(
                  margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  height: boxHeight,
                  child: LoginPageInputBox(
                    labelText: '생년월일(-생략)',
                    prefixIcon: const Icon(FontAwesomeIcons.birthdayCake, color: buttonLabelColor),
                    maxLength: 8,
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {
                      c.setBirthDay(value);
                      Logger().d('birthday : ${c.simpleLoginInfo.value!.birthDay}');
                    },
                  ),
                ),
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
                  child: LoginPageButton(
                    buttonText: '시작하기',
                    textStyle: Theme.of(context).textTheme.loginPageButtonText,
                    boxHeight: boxHeight,
                      onPressed: () async {

                        /* 유효성 검사 통과시 */
                        if (checkSimpleLoginInfo(context: context, simpleLoginInfo: c.simpleLoginInfo.value)) {
                          // web API 날려서 DB 저장후, 다시와서 페이지 이동해야함.
                          LoginResponseDto loginResponseDto = (await fetchLoginResponseDto(c.simpleLoginInfo.value)) as LoginResponseDto;

                          if (loginResponseDto.isLoginSuccess) {
                            Get.to(MainScreens(), transition: Transition.fade);
                          }
                        }
                    },
                  ),
                ),
                /* 로그인 페이지 이동 */
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: LoginPageButton(
                    boxHeight: boxHeight,
                    textStyle: Theme.of(context).textTheme.loginPageButtonText,
                    buttonText: '로그인 페이지',
                    onPressed: () {
                      Get.to(LoginPageScreen(), transition: Transition.fade);
                    },
                  ),
                ),
                /* 메인페이지 이동(임시사용) */
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: LoginPageButton(
                    boxHeight: boxHeight,
                    textStyle: Theme.of(context).textTheme.loginPageButtonText,
                    buttonText: '게시글',
                    onPressed: () {
                      Get.to(MainScreens(), transition: Transition.fade);
                    },
                  ),
                ),
                /* 샘플 페이지 이동(임시사용) */
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                  child: LoginPageButton(
                    boxHeight: boxHeight,
                    textStyle: Theme.of(context).textTheme.loginPageButtonText,
                    buttonText: '샘플',
                    onPressed: () {
                      Get.to(SampleScreens(), transition: Transition.fade);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ));
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
          child: ToggleButtons(
            borderColor: buttonBorderColor,
            selectedBorderColor: Color.fromRGBO(255, 255, 255, 0.7),
            fillColor: Color.fromRGBO(255, 255, 255, 0.7),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            children: <Widget>[
              Text('남',style: Theme.of(context).textTheme.loginPageInputBoxText),
              Text('여',style: Theme.of(context).textTheme.loginPageInputBoxText)
            ],
            isSelected: c.isGenderList.value ,
            onPressed: (int index) {
              c.setGender(index);
              Logger().d('nickname : ${c.simpleLoginInfo.value!.gender}');
            },
          )
        ),
        ),
    );
  }

  bool checkSimpleLoginInfo ({
    required BuildContext context,
    required SimpleLoginInfo? simpleLoginInfo,
    }) {

    // 메세지까지 띄워주는게 맞을까?
    if (simpleLoginInfo!.nickname == null) {
      flutterDialog(context : context, titleText: '알림', contentText: '별명을 입력해주세요');
      return false;

    } else if (simpleLoginInfo.birthDay == null) {
      flutterDialog(context : context, titleText: '알림', contentText: '생년월일을 입력해주세요');
      return false;

    } else if (simpleLoginInfo.gender == null) {
      flutterDialog(context : context, titleText: '알림', contentText: '성별을 선택해주세요');
      return false;
    }

    return true;
  }
}
