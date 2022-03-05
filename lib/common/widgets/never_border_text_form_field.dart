import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/wai_text.dart';

class NerverBorderTextFormField extends StatelessWidget {
  const NerverBorderTextFormField({
    Key? key,
    this.height,
    this.onChanged,
    this.labelText,
    this.keyboardType,
    this.maxLength,
    this.prefixIcon,
    this.errorText,
    this.maxLines,
    this.expands = false,
    this.initText = "",
    this.validator,
    this.onSaved
  }) : super(key: key);

  final double? height;
  final Function(String)? onChanged;
  final String? labelText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? prefixIcon;
  final String? errorText;
  final int? maxLines;
  final bool expands;
  final String initText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength ?? 100,
      maxLines: maxLines,
      expands: expands,
      validator: validator,
      onSaved: onSaved,
      controller: TextEditingController(text: initText),
      style: WaiTextStyle(fontSize: 16, color: Colors.black54).basic(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: WaiTextStyle(fontSize: 16, color: Colors.grey).basic(),
        floatingLabelStyle: WaiTextStyle(fontSize: 16, color: Colors.grey).basic(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorText: errorText,
        errorStyle: WaiTextStyle(fontSize: 16, color: WaiColors.errorRed).basic(),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: WaiColors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        /* border */
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        counterText:'',
      ),
    );
  }
}
