import 'package:wai/common/utils/api.dart';
import 'package:wai/common/utils/api_util.dart';
import 'package:http/http.dart' as http;
import 'package:wai/data/model/post/post_save_request_dto.dart';

class PostWriteApiProvider {

  savePost(PostSaveRequestDto postSaveRequestDto) async {
    http.Response response  = await postApiRequest("/api/post/savePost", postSaveRequestDto.toJson());

    Map<String, dynamic> map = utf8Decoding(response);
    //
    // if (response.statusCode == 200) {
    //   EnneagramTest myEnneagramTest = EnneagramTest.fromJson(map);
    //   return myEnneagramTest;
    // } else {
    //   loggerNoStack.e("error : api request error");
    // }
  }
}