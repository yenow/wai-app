import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/search/search_controller.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Form(
        key: SearchController.to.formKey,
        child: TextFormField(
            focusNode: SearchController.to.focusNode,
            maxLength: 100,
            minLines: 1,
            maxLines: 1,
            // maxLines: null,
            // expands: true,
            autofocus: true,
            onEditingComplete: SearchController.to.search,
            onChanged: SearchController.to.onChangedSearchText,
            cursorColor: WaiColors.white80,
            style: const TextStyle(fontSize: 20, color: WaiColors.white80),

            decoration: const InputDecoration(
                labelText: "검색할 내용을 입력해주세요.",
                labelStyle: TextStyle(fontSize: 16, color: WaiColors.white80),
                floatingLabelStyle: TextStyle(fontSize: 16, color: WaiColors.white80),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.only(bottom: 10),
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
