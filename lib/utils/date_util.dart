
import 'package:intl/intl.dart';

import 'logger.dart';

String dateTimeToString (DateTime insertDate) {
  String returnValue = "";
  // todo.  서버시간을 가져와야한다.
  DateTime now = DateTime.now();

  if (now.year == insertDate.year && now.month == insertDate.month
      && now.day == insertDate.day) {
    int differentHour = now.hour - insertDate.hour;
    returnValue = differentHour.toString() + "시간 전";
  } else if (now.year == insertDate.year) {
    returnValue = DateFormat('MM.dd hh:mm').format(insertDate);
  } else {
    returnValue = DateFormat('yyyy.MM.dd hh:mm').format(insertDate);
  }

  return returnValue;
}