import 'package:flutter/material.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_text_field.dart';
import 'package:wai/common/widgets/wai_text_form_field.dart';
import 'package:wai/controller/my_edit_controller.dart';

class MyEditForm extends StatelessWidget {
  const MyEditForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: MyEditController.to.formKey,
        child: Column(
          children: [
            WaiTextFormField(
              labelText: "닉네임",
              maxLength: 20,
              controller: MyEditController.to.textEditingController,
              onSaved: MyEditController.to.onSavedNickname,
              validator: MyEditController.to.validateNickname,
              onChanged: MyEditController.to.onChangedNickname,
            ),
          ],
        ),
      ),
    );
  }
}
