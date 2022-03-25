import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/search_controller.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Form(
        key: SearchController.to.formKey,
        child: TextFormField(
            maxLength: 100,
            maxLines: null,
            expands: true,
            autofocus: true,
            // onSaved: (value) {
            //   setState(() {
            //     searchText = value!;
            //   });
            // },
            cursorColor: WaiColors.white80,
            style: const TextStyle(fontSize: 18, color: WaiColors.white80),
            decoration: const InputDecoration(
                labelText: "검색할 내용을 입력해주세요.",
                labelStyle: TextStyle(fontSize: 16, color: WaiColors.white80),
                floatingLabelStyle: TextStyle(fontSize: 16, color: WaiColors.white80),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                counterText: '',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none
            )
        ),
      ),
    );
  }
}
