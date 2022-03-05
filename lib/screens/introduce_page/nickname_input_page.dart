import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_text.dart';
import 'package:wai/common/widgets/wai_text_field.dart';
import 'package:wai/data/model/sign_request_dto.dart';
import 'package:wai/models/user/api/user_request_dto.dart';
import 'package:wai/net/login/login_api.dart';
import 'package:wai/net/sign/sign_api.dart';
import 'package:wai/screens/introduce_page/who_am_i_screen.dart';
import 'package:wai/ui/login_screen/login_screen.dart';

class NicknameInputPage extends StatefulWidget {
  const NicknameInputPage({Key? key}) : super(key: key);

  @override
  _NicknameInputPageState createState() => _NicknameInputPageState();
}

class _NicknameInputPageState extends State<NicknameInputPage> {
  final _formKey = GlobalKey<FormState>();
  String nickname = "";
  String errorMessage = "";
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) { currentFocus.unfocus(); }
        },
        child: Scaffold(
          appBar: const WaiAppbar(
            title: Text("입력"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Blank(height: 10,),
                SizedBox(
                    height: 50,
                    child: Center(child: WaiText(text: "사용하실 닉네임을 입력해주세요.", style: WaiTextStyle(fontSize: 18).basic(),))
                ),
                _buildForm(),
                const Blank(height: 10,),
                _buildNextButton(),
                const Blank(height: 10,),
                // InkWell(
                //   child: Center(child: WaiText(text: "이미 등록된 아이디가 있으신가요?", style: WaiTextStyle(fontSize: 16).basic(),)),
                //   onTap: () {
                //     Get.to(() => const LoginPageScreen());
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Form _buildForm() {
    return Form(
      key: _formKey,
      child: WaiTextField(
        // prefixIcon: Icon(Icons.badge_outlined,),
        labelText: "닉네임",
        maxLength: 20,
        onSaved: (value) {
          setState(() {
            nickname = value!;
          });
        },
        validator: (nickname) {
          if (nickname!.isEmpty) {
            return "닉네임을 입력해주세요";
          } else if (nickname.length > 10) {
            return "닉네임은 10자리까지 가능합니다.";
          }

          if (errorMessage.isNotEmpty) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }

  SizedBox _buildNextButton() {
    return SizedBox(
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
        onPressed: clickNextButton,
      ),
    );
  }


  /// **************************************** function **************************************** ///

  void clickNextButton() async {
    setState(() {
      errorMessage = "";
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // AppController.to.createUserKeyAndPassword();

      await signUpAsNonMember();

      if (flag) {
        Get.off(()=> const WhoAmIScreen(), transition: Transition.rightToLeft);
      } else {

        setState(() {
          errorMessage = "이미 사용중인 닉네임입니다.";
        });
        _formKey.currentState!.validate();
      }
    }
  }

  Future<void> signUpAsNonMember() async {
    SignRequestDto signRequestDto = SignRequestDto(
      userKey: AppController.to.loginInfo.value.userKey,
      password: AppController.to.loginInfo.value.password,
      nickname: nickname,
    );

    await signUpAsNonMemberRequest(signRequestDto);
  }
}