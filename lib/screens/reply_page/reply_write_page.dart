import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/common/widgets/wai_text.dart';
import 'package:wai/common/widgets/wai_text_field.dart';
import 'package:wai/models/user/api/user_request_dto.dart';
import 'package:wai/net/login/login_api.dart';

class ReplyWritePage extends StatefulWidget {
  const ReplyWritePage({Key? key, required this.replyContent}) : super(key: key);
  final String replyContent;

  @override
  _ReplyWritePageState createState() => _ReplyWritePageState();
}

class _ReplyWritePageState extends State<ReplyWritePage> {
  final _formKey = GlobalKey<FormState>();
  String nickname = "";
  String errorMessage = "";

  void clickNextButton() async {
    setState(() {
      errorMessage = "";
    });

    // validation 이 성공하면 true 가 리턴
    if (_formKey.currentState!.validate()) {
      // validation 이 성공하면 폼 저장하기
      _formKey.currentState!.save();

      UserRequestDto userRequestDto = UserController.to.user.value.toUserRequestDto();
      userRequestDto.nickname = nickname;
      bool flag = await saveNickname(userRequestDto);

      if (flag) {
        AppController.to.snackbarKey.currentState!.showSnackBar(WaiSnackBar.basic(text: "닉네임이 변경되었습니다."));
        errorMessage = "";

      } else {

        setState(() {
          errorMessage = "이미 사용중인 닉네임입니다.";
        });
        _formKey.currentState!.validate();
      }
    }
  }

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
            title: Text("댓글수정"),
            isBackLeading: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Blank(height: 10,),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    height: 300,
                    child: WaiTextField(
                      // prefixIcon: Icon(Icons.badge_outlined,),
                      labelText: "닉네임",
                      maxLength: 1000,
                      maxLines: null,
                      expands: true,
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
                  ),
                ),
                const Blank(height: 10,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("수정", style: WaiTextStyle(color: Colors.white).basic(),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(WaiColors.darkBlueGrey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))
                    ),
                    onPressed: clickNextButton,
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
