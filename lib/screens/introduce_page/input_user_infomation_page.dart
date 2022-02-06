import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_text.dart';
import 'package:wai/common/widgets/wai_text_field.dart';
import 'package:wai/models/user/api/user_request_dto.dart';
import 'package:wai/net/login/login_api.dart';
import 'package:wai/screens/who_am_i_screen.dart';

class InputUserInfomationPage extends StatefulWidget {
  const InputUserInfomationPage({Key? key}) : super(key: key);

  @override
  _InputUserInfomationPageState createState() => _InputUserInfomationPageState();
}

class _InputUserInfomationPageState extends State<InputUserInfomationPage> {
  final _formKey = GlobalKey<FormState>();
  String nickname = "";
  // String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const WaiAppbar(
            title: Text("정보입력"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Blank(height: 10,),
                SizedBox(
                    height: 50,
                    child: Center(child: WaiText(text: "사용하실 별명을 입력해주세요.", style: WaiTextStyle(fontSize: 18).basic(),))
                ),
                Form(
                  key: _formKey,
                  child: WaiTextField(
                    // prefixIcon: Icon(Icons.badge_outlined,),
                    labelText: "별명",
                    maxLength: 20,
                    onSaved: (value) {
                      setState(() {
                        nickname = value!;
                      });
                    },
                    validator: (nickname) {
                      if (nickname!.isEmpty) {
                        return "별명을 입력해주세요";
                      } else if (nickname.length > 10) {
                        return "별명은 10자리까지 가능합니다.";
                      }
                      return null;
                    },
                  ),
                ),
                const Blank(height: 10,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("다음", style: WaiTextStyle(color: Colors.white).basic(),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(darkBlueGrey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))
                    ),
                    onPressed: () async {
                      // validation 이 성공하면 true 가 리턴
                      if (_formKey.currentState!.validate()) {
                        // validation 이 성공하면 폼 저장하기
                        _formKey.currentState!.save();

                        UserRequestDto userRequestDto = UserController.to.user.value.toUserRequestDto();
                        userRequestDto.nickname = nickname;
                        bool flag = await saveNickname(userRequestDto);

                        if (flag) {
                          // Get.off(()=> WhoAmIScreen(), transition: Transition.rightToLeft);
                        } else {

                          Get.snackbar(
                            '알림',
                            '이미 사용중인 별명입니다.',
                            backgroundColor: Colors.white,
                          );
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}