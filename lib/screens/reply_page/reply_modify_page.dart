import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/widgets/never_border_text_form_field.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/common/widgets/wai_text_field.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/net/reply/reply_api.dart';

class ReplyModifyPage extends StatefulWidget {
  const ReplyModifyPage({Key? key, required this.reply}) : super(key: key);
  final Reply reply;

  @override
  _ReplyModifyPageState createState() => _ReplyModifyPageState();
}

class _ReplyModifyPageState extends State<ReplyModifyPage> {
  String replyContent = "";
  late Reply reply;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    reply = widget.reply;
    super.initState();
  }

  void _onTapSaveButton() async {
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ReplyRequestDto requestDto = ReplyRequestDto();
      requestDto.setReplyRequestDto(reply);
      requestDto.replyContent = replyContent;

      await saveReply(requestDto);
      AppController.to.snackbarKey.currentState!.showSnackBar(WaiSnackBar.basic(text: "댓글이 수정되었습니다."));
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: WaiAppbar(
          title: const Text("댓글수정"),
          isBackLeading: true,
          actions: [
            _buildAppbarActions(context)
          ],
        ),
        body: Form(
          key: _formKey,
          child: NerverBorderTextFormField(
            initText: reply.replyContent!,
            labelText: "댓글을 입력해주세요.",
            maxLength: 1000,
            maxLines: null,
            expands: true,
            onSaved: (value) {
              replyContent = value!;
            },
            validator: (value) {
              if (value!.trim() == "") {
                AppController.to.snackbarKey.currentState!.showSnackBar(WaiSnackBar.basic(text: "댓글을 입력해주세요."));
              }
            },
          ),
        ),
      )
    );
  }

  Widget _buildAppbarActions(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: GestureDetector(
        onTap: _onTapSaveButton,
        child: const Icon(FontAwesomeIcons.checkCircle, size: 25, color: Colors.black54,),
      ),
    );
  }

}
