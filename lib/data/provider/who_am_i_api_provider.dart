import 'package:wai/common/utils/api_util.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/data/dto/enneagram_test_request_dto.dart';
import 'package:http/http.dart' as http;
import 'package:wai/data/model/enneagram_test.dart';

class WhoAmIApiProvider {

  selectEnneagramType(EnneagramTestRequestDto enneagramTest) async {
    http.Response response  = await postRequest("/api/enneagramTest/saveSelectedEnneagramTestResult", enneagramTest.toJson());

    Map<String, dynamic> map = utf8Decoding(response);

    if (response.statusCode == 200) {
      EnneagramTest myEnneagramTest = EnneagramTest.fromJson(map);
      return myEnneagramTest;
    } else {
      loggerNoStack.e("error : api request error");
    }
  }
}