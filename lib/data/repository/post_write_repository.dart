import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/sign/sign_request_dto.dart';
import 'package:wai/data/provider/post_write_api_provider.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';
import 'package:wai/data/provider/who_am_i_api_provider.dart';
import 'package:wai/data/model/post/post_save_request_dto.dart';

class PostWriteRepository {
  final PostWriteApiProvider postWriteApiProvider;

  PostWriteRepository({required this.postWriteApiProvider});

  savePost(PostSaveRequestDto postSaveRequestDto) async {
    var result = await postWriteApiProvider.savePost(postSaveRequestDto);
    return result;
  }
}