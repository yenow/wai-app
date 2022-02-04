// import 'package:flutter/cupertino.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:wai/sample/add_interactivity.dart';
//
// import '../../../common/controller/app_controller.dart';
//
// class BirthdayForm extends StatelessWidget {
//   const BirthdayForm({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData queryData;
//     queryData = MediaQuery.of(context);
//     double width =  queryData.size.width;
//     double boxHeight =  queryData.size.height/15;   // TextField, button의 높이
//     double topPadding = boxHeight/10;
//     double verticalPadding = 4;
//     double horizontalPadding = 15;
//
//     final AppController c = Get.put(AppController());
//
//     return Container(
//         margin:EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
//         height: boxHeight,
//         child: /*Obx(() => NumberPicker(
//           value: c.simpleLoginInfo.value!.year,   // c.simpleLoginInfo.value!.year
//           minValue: c.simpleLoginInfo.value!.year - 150,
//           maxValue: c.simpleLoginInfo.value!.year + 1,
//
//           onChanged: (newYear) {
//             logger.d(newYear);
//             c.setSimpleLoginInfoYear(newYear);
//           },*/
//         ))
//     );
//   }
// }
