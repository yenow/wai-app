import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaiDropDown extends StatefulWidget {
  const WaiDropDown({Key? key}) : super(key: key);

  @override
  _WaiDropDownState createState() => _WaiDropDownState();
}

class _WaiDropDownState extends State<WaiDropDown> {
  final List<String> _valueList = ['서울', '인천', '수원', '대전', '대구', '광주', '부산'];
  String _selectedValue = '수원';


  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedValue,
      items: _valueList.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _selectedValue = value!;
        });
      },
    );
  }
}
