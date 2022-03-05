import 'dart:convert';

import 'package:wai/common/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/logger.dart';
import 'package:wai/models/enneagram/enneagram.dart';

class EnneagramApiProvider {

  getEnneagramInformation() async {
     http.Response response = await getApiRequest("/api/enneagram/getEnneagramInformation");

     if (response.statusCode == 200) {
       List list = json.decode(utf8.decode(response.bodyBytes));
       List<Enneagram> enneagrams = [];

       for (var element in list) {
         Enneagram temp = Enneagram.fromJson(element);
         enneagrams.add(temp);
       }
       return enneagrams;

     } else {
       loggerNoStack.e("error : api request error");
     }
  }
}