
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';

import 'logger.dart';

String dateTimeToString (DateTime now, DateTime insertDate) {
  String returnValue = "";
  
  if (now.year == insertDate.year && now.month == insertDate.month
      && now.day == insertDate.day && now.hour == insertDate.hour && now.minute == insertDate.minute) {
    int different = now.second - insertDate.second;
    returnValue = different.toString() + "초 전";

  } else if (now.year == insertDate.year && now.month == insertDate.month
      && now.day == insertDate.day && now.hour == insertDate.hour) {
    int different = now.minute - insertDate.minute;
    returnValue = different.toString() + "분 전";

  } else if (now.year == insertDate.year && now.month == insertDate.month
      && now.day == insertDate.day) {
    int different = now.hour - insertDate.hour;
    returnValue = different.toString() + "시간 전";

  } else if (now.year == insertDate.year) {
    returnValue = DateFormat('MM.dd hh:mm').format(insertDate);

  } else {
    returnValue = DateFormat('yyyy.MM.dd hh:mm').format(insertDate);
  }

  return returnValue;
}
